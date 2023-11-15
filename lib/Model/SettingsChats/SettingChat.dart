 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> getFriendName(String friendUid) async {
   final currentUser = FirebaseAuth.instance.currentUser;
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(currentUser!.uid).collection('friends').doc(friendUid).get();
      if (userSnapshot.exists) {
        String name = userSnapshot['name'];

          return name;
        } else {
          return 'Друг не найден';
        }
      
    } catch (e) {
      print('Ошибка: $e');
      return 'Произошла ошибка';
    }
  }