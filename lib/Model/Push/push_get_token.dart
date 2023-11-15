import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<String?> getPushToken(String friendUid) async {
  try {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(friendUid)
          .get();

      if (snapshot.exists && snapshot.data() != null && snapshot.data()!['push_token'] != null) {
        print(snapshot.data()!['push_token'].toString());
        return snapshot.data()!['push_token'].toString();
      } else {
        return null;
      }
    } else {
      print('User not authenticated');
      return null;
    }
  } catch (error) {
    print("Error getting push token: $error");
    return null;
  }
}