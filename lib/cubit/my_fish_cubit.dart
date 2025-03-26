// ignore_for_file: depend_on_repositories, depend_on_referenced_packages

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/models/my_fish_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyFishesCubit extends Cubit<MyFishesState> {
  MyFishesCubit() : super(MyFishesInitial());

  List<MyFishModel> _myFishes = [];

  List<MyFishModel> get myFishes => _myFishes;

  Future<void> loadFishes() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('my_fishes');
    if (data != null) {
      final decoded = json.decode(data) as List;
      _myFishes = decoded.map((e) => MyFishModel.fromJson(e)).toList();
      emit(MyFishesLoaded(List.from(_myFishes)));
    } else {
      emit(MyFishesLoaded(const []));
    }
  }

  Future<void> addFish(MyFishModel fish) async {
    _myFishes.add(fish);
    emit(MyFishesLoaded(List.from(_myFishes)));
    await _saveToPrefs();
  }

  Future<void> editFish(int index, MyFishModel updatedFish) async {
    _myFishes[index] = updatedFish;
    emit(MyFishesLoaded(List.from(_myFishes)));
    await _saveToPrefs();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = json.encode(_myFishes.map((e) => e.toJson()).toList());
    await prefs.setString('my_fishes', encoded);
  }

  Future<void> deleteFish(int index) async {
    _myFishes.removeAt(index);
    emit(MyFishesLoaded(List.from(_myFishes)));
    await _saveToPrefs();
  }
}

@immutable
abstract class MyFishesState {}

class MyFishesInitial extends MyFishesState {}

class MyFishesLoaded extends MyFishesState {
  final List<MyFishModel> fishes;

  MyFishesLoaded(this.fishes);
}
