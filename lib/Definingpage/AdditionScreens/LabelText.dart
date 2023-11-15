import 'package:flutter/material.dart';

class LabelText extends StatefulWidget {
  const LabelText({super.key, required this.text});
  final String text;
  @override
  State<LabelText> createState() => _LabelTextState();
}

class _LabelTextState extends State<LabelText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: const TextStyle(
        color: Color(0xFFD9D8DE),
        fontSize: 16,
        
      ),
       textAlign: TextAlign.center,
    );
  }
}