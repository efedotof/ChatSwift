import 'package:flutter/material.dart';

class AvatarSelected extends StatefulWidget {
  const AvatarSelected({super.key, required this.images});
  final String images;

  
  @override
  State<AvatarSelected> createState() => _AvatarSelectedState();
}

class _AvatarSelectedState extends State<AvatarSelected> {
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child:  Image.asset(widget.images, width: 48.0, height: 48.0),
            );
  }
}