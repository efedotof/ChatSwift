import 'package:flutter/material.dart';

class MyTextFields extends StatefulWidget {
  final String hintText;
  final TextEditingController textController;

  const MyTextFields({Key? key, required this.hintText, required this.textController}) : super(key: key);

  @override
  State<MyTextFields> createState() => _MyTextFieldsState();
}

class _MyTextFieldsState extends State<MyTextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width / 1.3,
      child: TextField(
        controller: widget.textController, 
        decoration: InputDecoration(
          hintText: widget.hintText, 
        ),
      ),
    );
  }
}