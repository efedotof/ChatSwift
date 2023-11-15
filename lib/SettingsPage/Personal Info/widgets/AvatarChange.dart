import 'package:flutter/material.dart';

class AvatarChange extends StatefulWidget {
  const AvatarChange({super.key});

  @override
  State<AvatarChange> createState() => _AvatarChangeState();
}

class _AvatarChangeState extends State<AvatarChange> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Theme.of(context).primaryColor.withOpacity(0.8),
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
            Container(
              decoration:
                  const BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue, // Цвет границы
                  width: 1.0, // Ширина границы
                ),
                borderRadius: BorderRadius.circular(8.0), // Закругленные углы
              ),
              child: Text(
                'Upload new photo',
                style: TextStyle(
                  color: Colors.blue, // Цвет текста
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
