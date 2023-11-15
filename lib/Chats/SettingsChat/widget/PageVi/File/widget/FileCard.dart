import 'package:flutter/material.dart';

class FileCards extends StatefulWidget {
  const FileCards({super.key});

  @override
  State<FileCards> createState() => _FileCardsState();
}

class _FileCardsState extends State<FileCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue
      ),
      child: Row(
        children: [
          Icon(Icons.file_open),
          Text('Название файла')
        ],
      ),
    );
  }
}