import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/cubit/my_fish_cubit.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/models/my_fish_model.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/pages/add_custom_fish_screen.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/pages/edit_custom_fish_screen.dart';

class MyFishesScreen extends StatefulWidget {
  const MyFishesScreen({super.key});

  @override
  State<MyFishesScreen> createState() => _MyFishesScreenState();
}

class _MyFishesScreenState extends State<MyFishesScreen> {
  @override
  void initState() {
    context.read<MyFishesCubit>().loadFishes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF6BAFC0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D90A8),
        centerTitle: false,
        title: const Text(
          'My Fishes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<MyFishesCubit, MyFishesState>(
        builder: (context, state) {
          if (state is MyFishesLoaded) {
            if (state.fishes.isEmpty) {
              return const Center(
                child: Text(
                  'No fishes added yet 🐟',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: state.fishes.length,
              itemBuilder: (context, index) {
                final fish = state.fishes[index];
                return FishCard(
                  fish: fish,
                  screenWidth: screenWidth,
                  index: index,
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddCustomFishScreen(),
            ),
          );
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFFFE0303), Color(0xFFFBE905)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class FishCard extends StatelessWidget {
  final MyFishModel fish;
  final double screenWidth;
  final int index;

  const FishCard({
    required this.fish,
    required this.screenWidth,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2D90A8),
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(fish.image, fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fish.title,
                      style: TextStyle(
                        fontSize: screenWidth > 375 ? 16.0 : 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => DetailsScreen(
                                  title: fish.title,
                                  image: fish.image,
                                  category: fish.typeOfFish,
                                  textColumn: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Animal species",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        fish.typeOfFish,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        "Date",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        fish.date,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        "Where did you meet?",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        fish.placeWhereMeet,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        "Description",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        fish.description,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  fish: fish,
                                  index: index,
                                ),
                          ),
                        );
                      },

                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFE0303), Color(0xFFFBE905)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'Read more',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  final String title;
  final String image;
  final String category;
  final Widget textColumn;
  final MyFishModel fish;
  final int index;

  const DetailsScreen({
    required this.title,
    required this.image,
    required this.category,
    required this.textColumn,
    required this.fish,
    required this.index,
    super.key,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late MyFishModel fish;

  @override
  void initState() {
    super.initState();
    fish = widget.fish;
  }

  void _updateFish(MyFishModel updatedFish) {
    setState(() {
      fish = updatedFish;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6BAFC0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D90A8),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Info",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 28,
              height: 28,
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 28,
                onPressed: () {
                  context.read<MyFishesCubit>().deleteFish(widget.index);
                  Navigator.pop(context);
                },
                icon: const FaIcon(FontAwesomeIcons.trash, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          final updatedFish = await Navigator.push<MyFishModel>(
            context,
            MaterialPageRoute(
              builder:
                  (_) => EditCustomFishScreen(
                    fishToEdit: fish,
                    indexToEdit: widget.index,
                  ),
            ),
          );

          if (updatedFish != null) {
            _updateFish(updatedFish);
          }
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFFFE0303), Color(0xFFFBE905)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.edit, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                widget.image,
                height: 280,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 22.0,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD313),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                widget.category,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            widget.textColumn,
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
