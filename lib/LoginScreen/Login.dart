
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mychats/ThemeMyApp/CustomTheme.dart';
import 'package:mychats/ThemeMyApp/config.dart';
import '../Definingpage/AdditionScreens/LabelText.dart';
import 'Page/NumberAndPassword/LoginIsUsingYourNumberAndPassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: LoginIsUsingYourNumberAndPassword()
    );
  }
}









/**********************************************/
/* Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах. */
/* © 2023 BookVerse. Все права защищены. */
/**********************************************/