/// *****************************************
/*                                          */
/*        📱 Название приложения: BookVerse      */
/*        📚 Описание: Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах.    */
/*        👤 Автор: efedotov                       */
/*        📅 Дата: 2023-07-29                 */
/*        🚀 Версия: 0.0                         */
/*                                          */
/*        © Все права защищены.                */
/*                                          */
/// *****************************************


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';




class CustomTheme with ChangeNotifier{
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  
  Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', isDark);
    
  }

  // Метод для получения сохраненной темы из SharedPreferences
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkTheme') ?? true;
    _isDarkTheme = isDark;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
    saveTheme(_isDarkTheme);
  }

  static ThemeData get lightTheme { //1
    return ThemeData(
    primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(color: Color(0xFF7A7C91), fontSize: 21),
      bodyText2: TextStyle(color: Color(0xFFBDBDC1), fontSize: 21, fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Color(0xFFD2D4D5), fontSize: 15)
    ),
    highlightColor: const Color(0xFFBBC5C1),
    indicatorColor: const Color(0xFF4F5053),
       focusColor:  const Color(0xFF62697B),
        cardColor:  const Color(0xFFF6F5FA),
        primaryColor: const Color(0xFFFFFFFF),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor:  Color(0xFFFFFFFF),
          selectedItemColor: Color(0xFF7EC6B0), // Цвет активных иконок и текста
          unselectedItemColor: Color(0xFFC5C4CA), // Цвет неактивных иконок
          selectedLabelStyle:  TextStyle(color:Color(0xFFA2A2A7)), // Цвет активного текста
          unselectedLabelStyle:  TextStyle(color:Color(0xFFE2E2E2)), // Цвет неактивного текста
        ),
         appBarTheme: const AppBarTheme(
          backgroundColor:  Colors.transparent,
          iconTheme: IconThemeData(color:  Color(0xFF82808A)), // Цвет иконок AppBar
          actionsIconTheme: IconThemeData(color: Color(0xFF82808A)), // Цвет дополнительных иконок AppBar
        ),
          // drawerTheme: DrawerThemeData(
          //   scrimColor: Color(0xFF6F6F6F),

          // )
          
        );
  }
  static ThemeData get darkTheme {
    return ThemeData(

      focusColor:  const Color(0xFF6F7688),
      primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(color: Color(0xFFBBC2CB),fontSize: 20),
      bodyText2: TextStyle(color: Color(0xFF575F77), fontSize: 21, fontWeight: FontWeight.bold),
    ),

    highlightColor: const Color(0xFF597980),

    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Color(0xFF414A63), fontSize: 15)
    ),
    indicatorColor: const Color(0xFF738C97),
        cardColor:  const Color(0xFF33384B),
        primaryColor: const Color(0xFF131E34),
         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF010C1E) ,
          selectedItemColor:  Color(0xFF4B8175), // Цвет активных иконок и текста
          unselectedItemColor: Color(0xFFD2D9E7), // Цвет неактивных иконок
          selectedLabelStyle:  TextStyle(color: Color(0xFF324F56)), // Цвет активного текста
          unselectedLabelStyle:  TextStyle(color: Color(0xFF95969B))
          ),
         appBarTheme: const AppBarTheme(
          backgroundColor:  Colors.transparent,
          iconTheme: IconThemeData(color:  Color(0xFF333A4C) ), // Цвет иконок AppBar
          actionsIconTheme: IconThemeData(color:  Color(0xFF333A4C)), // Цвет дополнительных иконок AppBar
        ),
        );
  }
}