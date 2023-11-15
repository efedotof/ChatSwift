import 'package:flutter/material.dart';

class CardsToSettingsScreens extends StatefulWidget {
  const CardsToSettingsScreens({super.key,
  required this.icon,
  required this.text,
  required this.onTaps,
  required this.colorToIcons,
  
  
  
  });

  final IconData icon;
  final String text;
  final Function onTaps;
  final Color colorToIcons;


  @override
  State<CardsToSettingsScreens> createState() => _CardsToSettingsScreensState();
}

class _CardsToSettingsScreensState extends State<CardsToSettingsScreens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                color: widget.colorToIcons.withOpacity(0.1),
                shape: BoxShape.circle
              ),
              child: Icon(widget.icon, color: widget.colorToIcons,),
            ),
            Text(widget.text,  style: Theme.of(context).primaryTextTheme.bodyText1),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent
              ),
              child: IconButton(onPressed: 
              (){
                 widget.onTaps();
            
              }, icon: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).focusColor)),
            ),
          ],
        ),
      ),
    );
  }
}