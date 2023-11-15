import 'package:flutter/material.dart';
import 'package:mychats/Definingpage/DefiningPage.dart';
import 'package:mychats/Model/Auth/AutoLogin.dart';
import 'package:mychats/Model/Auth/Login.dart';
class Exit extends StatefulWidget {
  const Exit({super.key});

  @override
  State<Exit> createState() => _ExitState();
}

class _ExitState extends State<Exit> {
  AuthLoginService authService = AuthLoginService();



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Подтвердите выход'),
      content: Text('Вы уверены, что хотите выйти из приложения?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: Text('Отмена'),
        ),
        TextButton(
          onPressed: () {
            authService.signOut();
            saveCredentialsToSharedPreferences('','');
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DefiningPage()),
    );
          },
          child: Text('Выйти'),
        ),
      ],
    );
  }
}