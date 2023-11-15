import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mychats/HomeScreen/Home.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
        
  Future<void> registerUser(
    String firstName,
    String lastName,
    String email,
    String birthDate,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = authResult.user;

      if (user != null) {
        // Adding user details to the 'users' collection
        await _firestore.collection('users').doc(user.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'birthDate': birthDate,
        });

        if (user != null) {
          final String? fcmToken = await _firebaseMessaging.getToken();
        if (fcmToken != null) {
          await _firestore.collection('users').doc(user.uid).update({
            'token_push': fcmToken,
          });
        }
        }




        CollectionReference iventCollection = _firestore
            .collection('users')
            .doc(user.uid)
            .collection('ivent');

        await iventCollection.doc('ivent').set({
          'FriendsId': [],
          'friendsName': [],
        });

        CollectionReference FriedsCollection = _firestore
            .collection('users')
            .doc(user.uid)
            .collection('Friends');

        // Redirecting the user to the Home page
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Home(),
        ));
      }
    } catch (e) {
      print('Error registering user: $e');
    }
  }
}