import 'package:flutter/material.dart';

class ButtonLogin extends StatefulWidget {
  const ButtonLogin({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;


  @override
  State<ButtonLogin> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFFDFDFE),
        border: Border.all(
          color: const Color(0xFFD9D8DE)
        ),
      ),
      child:TextButton(onPressed: (){widget.onPressed();}, child: Text(widget.text, style: const TextStyle(color: Color(0xFFBAACFA)),)),
    );
  }
}