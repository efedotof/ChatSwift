import 'package:flutter/material.dart';
import 'package:mychats/ThemeMyApp/CustomTheme.dart';
import 'package:mychats/ThemeMyApp/config.dart';



class SelectableContainer extends StatefulWidget {
  final String text;
  final String images;
  final bool isSelected;
  SelectableContainer({required this.text, required this.images, required this.isSelected});

  @override
  _SelectableContainerState createState() => _SelectableContainerState();
}

class _SelectableContainerState extends State<SelectableContainer> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: 100, // Измените размеры по вашему усмотрению
            height: 150,
             decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
      
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(widget.images, width: 48.0, height: 48.0),
                    Text(widget.text,  style: TextStyle(
            color: currentTheme.currentTheme == CustomTheme.darkTheme
                ? const Color(0xFF6F6F6F)
                : const Color(0xFF6F6F6F),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),),
                  ],
                ),
              ],
            ),
          ),
          if (widget.isSelected)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}