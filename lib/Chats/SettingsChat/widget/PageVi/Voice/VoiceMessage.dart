import 'package:flutter/material.dart';

import 'widget/VoiceMessage.dart';

class VoiceMessagesGrid extends StatefulWidget {
  const VoiceMessagesGrid({super.key});

  @override
  State<VoiceMessagesGrid> createState() => _VoiceMessagesGridState();
}

class _VoiceMessagesGridState extends State<VoiceMessagesGrid> {
 @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
      child: Column(
        children: List.generate(
          100, (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: VoiceMessage(),
          )),
      ),
    );
  }
}