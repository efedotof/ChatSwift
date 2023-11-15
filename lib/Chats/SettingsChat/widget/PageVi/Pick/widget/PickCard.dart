import 'package:flutter/material.dart';

class PickCards extends StatefulWidget {
  const PickCards({super.key});

  @override
  State<PickCards> createState() => _PickCardsState();
}

class _PickCardsState extends State<PickCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
        
          color: Colors.amber
        ),
      ),
    );
  }
}