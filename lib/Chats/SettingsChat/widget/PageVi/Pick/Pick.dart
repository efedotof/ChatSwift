import 'package:flutter/material.dart';

import 'widget/PickCard.dart';

class PickGrid extends StatefulWidget {
  const PickGrid({super.key});

  @override
  State<PickGrid> createState() => _PickGridState();
}

class _PickGridState extends State<PickGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child:PickCards()
            );
          }),
        );
  }
}