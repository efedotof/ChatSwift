import 'package:flutter/material.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({super.key});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
        
          color: Colors.amber
        ),
        child: Center(child: GestureDetector(child: Icon(Icons.play_arrow),),),
      ),
    );
  }
}