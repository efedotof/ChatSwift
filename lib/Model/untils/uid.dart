import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> getCurrentUserId() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    String userId = user.uid;

    // Access Firestore collection
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userSnapshot.exists) {
      Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
      String firstName = userData['firstName'] ?? '';
      String lastName = userData['lastName'] ?? '';

      return '$userId, $firstName $lastName';
    } else {
      return '';
    }
  } else {
    return '';
  }
}
