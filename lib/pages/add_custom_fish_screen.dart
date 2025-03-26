import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/cubit/my_fish_cubit.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/models/my_fish_model.dart';

class AddCustomFishScreen extends StatefulWidget {
  const AddCustomFishScreen({super.key});

  @override
  State<AddCustomFishScreen> createState() => _AddCustomFishScreenState();
}

class _AddCustomFishScreenState extends State<AddCustomFishScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _selectedImage;
  DateTime selectedDate = DateTime.now();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveFish() {
    if (_titleController.text.isEmpty ||
        _typeController.text.isEmpty ||
        _placeController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all fields and select an image."),
        ),
      );
      setState(() {});
      return;
    }

    final newFish = MyFishModel(
      title: _titleController.text,
      image: _selectedImage!.path,
      typeOfFish: _typeController.text,
      date:
          "${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.year}",
      placeWhereMeet: _placeController.text,
      description: _descriptionController.text,
    );

    context.read<MyFishesCubit>().addFish(newFish);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color(0xFF2D90A8),
        centerTitle: false,
        title: const Text("New fish", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Cover", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child:
                    _selectedImage == null
                        ? const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.orange,
                            size: 40,
                          ),
                        )
                        : ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(_selectedImage!, fit: BoxFit.cover),
                        ),
              ),
            ),
            const SizedBox(height: 16),
            _buildLabel("Title"),
            _buildField(_titleController, 'Enter fish name'),
            _buildLabel("Type of fish"),
            _buildField(_typeController, 'Enter type of fish'),
            _buildLabel("Date"),
            SizedBox(
              height: 150,
              child: CupertinoTheme(
                data: const CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate,
                  onDateTimeChanged:
                      (value) => setState(() => selectedDate = value),
                ),
              ),
            ),
            _buildLabel("Where did you meet?"),
            _buildField(
              _placeController,
              'Please indicate where you encountered the animal',
            ),
            _buildLabel("Description"),
            _buildField(
              _descriptionController,
              'Enter description',
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: _saveFish,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFE0303), Color(0xFFFBE905)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 6),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    ),
  );

  Widget _buildField(
    TextEditingController controller,
    String hintText, {
    int maxLines = 1,
  }) => TextField(
    controller: controller,
    maxLines: maxLines,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: const TextStyle(color: Color(0xFFB8B8B8), fontSize: 12.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );
}
