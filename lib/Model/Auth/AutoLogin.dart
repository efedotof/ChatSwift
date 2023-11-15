import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychats/HomeScreen/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> autoSignInWithEmailAndPass(BuildContext context) async {
  try {
    final prefs = await SharedPreferences.getInstance();

    // Получить сохраненные email и пароль из SharedPreferences.
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');

    if (savedEmail != null && savedPassword != null) {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: savedEmail,
        password: savedPassword,
      );

      User newUser = userCredential.user!;
      print('Вход выполнен: ${newUser.email}');

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      ));
      
    } else {
      print('Email и пароль не найдены в SharedPreferences.');
    }
  } catch (e) {
    print('Ошибка при входе: $e');
  }
}


void saveCredentialsToSharedPreferences(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
  }