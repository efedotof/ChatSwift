import 'package:flutter/material.dart';

class CheckBoxCustomItemMenu extends StatefulWidget {
  const CheckBoxCustomItemMenu({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<CheckBoxCustomItemMenu> createState() => _CheckBoxCustomItemMenuState();
}

class _CheckBoxCustomItemMenuState extends State<CheckBoxCustomItemMenu> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(widget.text,
                  maxLines: 3,
                  style: Theme.of(context).primaryTextTheme.bodyText1)),
          Switch(
            splashRadius: 50.0,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = !isChecked;
              });
            },
          )
        ],
      ),
    );
  }
}
