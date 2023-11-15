import 'package:flutter/material.dart';
import 'package:mychats/ThemeMyApp/CustomTheme.dart';
import 'package:mychats/ThemeMyApp/config.dart';


import '../widgets/DateTextFormatter.dart';

class BirthdatePage extends StatefulWidget {
  final TextEditingController nameController;
  const BirthdatePage({super.key, required this.nameController});

  @override
  State<BirthdatePage> createState() => _BirthdatePageState();
}

class _BirthdatePageState extends State<BirthdatePage> {







  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).primaryColor,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Пожалуйста,\nукажите вашу дату рождения', 
            style: TextStyle(
              color: currentTheme.currentTheme == CustomTheme.darkTheme
                  ? const Color(0xFF6F6F6F)
                  : const Color(0xFF6F6F6F),
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.9,
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
            child: TextFormField(
              controller: widget.nameController,
              keyboardType: TextInputType.number, // Установите тип клавиатуры для ввода чисел
              inputFormatters: [DateTextFormatter()],
              decoration: InputDecoration(
                labelText: 'Введите дату рождения', // Обновлен текст
                border: InputBorder.none,
                labelStyle: TextStyle(
                  color: currentTheme.currentTheme == CustomTheme.darkTheme
                      ? const Color(0xFF6F6F6F)
                      : const Color(0xFF6F6F6F),
                ),
              ),
              maxLines: 1,
              style: TextStyle(
                color: currentTheme.currentTheme == CustomTheme.darkTheme
                    ? const Color(0xFF6F6F6F)
                    : const Color(0xFF6F6F6F),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}