import 'package:flutter/material.dart';

class VoiceMessage extends StatefulWidget {
  const VoiceMessage({super.key});

  @override
  State<VoiceMessage> createState() => _VoiceMessageState();
}

class _VoiceMessageState extends State<VoiceMessage> {
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
          Icon(Icons.play_arrow),
          Text('Название файла')
        ],
      ),
    );
  }
}