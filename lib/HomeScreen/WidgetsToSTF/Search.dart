import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          children: [
            Container(
                width: MediaQuery.of(context).size.width - 180,
                height: 20,
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                )),
            const SizedBox(
              width: 5,
            ),
            Icon(Icons.search,color: Theme.of(context).focusColor),
          ],
        ),
      ),
    );
  }
}
