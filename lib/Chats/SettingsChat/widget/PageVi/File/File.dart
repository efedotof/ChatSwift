import 'package:flutter/material.dart';

import 'widget/FileCard.dart';

class FileGrid extends StatefulWidget {
  const FileGrid({super.key});

  @override
  State<FileGrid> createState() => _FileGridState();
}

class _FileGridState extends State<FileGrid> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          100, (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: FileCards(),
          )),
      ),
    );
  }
}