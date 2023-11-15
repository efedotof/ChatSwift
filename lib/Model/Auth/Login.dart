import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychats/HomeScreen/Home.dart';

class AuthLoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Вход пользователя по электронной почте и паролю
  Future<void> signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = authResult.user;

      if (user != null) {
        // Вход успешен
        print('Вход успешен: ${user.email}');


        // Перейти на страницу Home только после успешного входа
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Home(),
        ));
      }
    } catch (e) {
      print('Ошибка при входе: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('Пользователь вышел из учетной записи');
    } catch (e) {
      print('Ошибка при выходе из учетной записи: $e');
    }
  }
}
