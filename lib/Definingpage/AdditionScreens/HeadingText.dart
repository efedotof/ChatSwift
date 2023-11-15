import 'package:flutter/material.dart';

class HeadingText extends StatefulWidget {
  const HeadingText({super.key, required this.text});
  final String text;
  @override
  State<HeadingText> createState() => _HeadingTextState();
}

class _HeadingTextState extends State<HeadingText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: const TextStyle(
        color: Color(0xFFAEA3F7),
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    );
  }
}