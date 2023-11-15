import 'package:flutter/material.dart';

class CardLinks extends StatefulWidget {
  const CardLinks({super.key, 
    required this.icon,
    required this.text,
  
  
  });
  final String text;
  final IconData icon;

  @override
  State<CardLinks> createState() => _CardLinksState();
}

class _CardLinksState extends State<CardLinks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey
          ),
          child: Icon(widget.icon),
        ),

        Text(widget.text)
      ],
    );
  }
}