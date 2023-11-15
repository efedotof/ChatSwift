import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class File extends StatefulWidget {
  const File({super.key});

  @override
  State<File> createState() => _FileState();
}

class _FileState extends State<File> {
Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    // Handle the picked image file as needed
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // Handle the picked file as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],

              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.collections, color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFFBBC2CB)
                              : const Color(0xFF7A7C91)),
                          Gap(MediaQuery.of(context).size.width * 0.1),
                          Text('Выбрать из Галереи', style: TextStyle(color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFFBBC2CB)
                              : const Color(0xFF7A7C91)),),
                        ],
                      ),
                    ),
                    Gap(10),
                    Center(
                      child: Container(
                        height: 2.0,
                        width: MediaQuery.of(context).size.width * 0.05,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFFBBC2CB)
                            : const Color(0xFF7A7C91)).withOpacity(0.3),
                      ),
                    ),
                    Gap(10),
                    GestureDetector(
                      onTap: _pickFile,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.cloud_queue, color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFFBBC2CB)
                              : const Color(0xFF7A7C91)),
                          Gap(MediaQuery.of(context).size.width * 0.1),
                          Text('Выбрать из файлов', style: TextStyle(color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFFBBC2CB)
                              : const Color(0xFF7A7C91)),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}