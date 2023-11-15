import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> removeFromArrays(String friendIdToRemove, String friendNameToRemove) async {
  try {
    
    final user = FirebaseAuth.instance.currentUser;

    // Check if the user is signed in
    if (user == null) {
      print('User not signed in');
      return;
    }

    // Get a reference to the user document
    DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid).collection('ivent').doc('ivent');

    // Get the current values of the arrays
    DocumentSnapshot userDocSnapshot = await userDocRef.get();
    List<dynamic> friendsId = userDocSnapshot.get('FriendsId');
    List<dynamic> friendsName = userDocSnapshot.get('friendsName');

      await userDocRef.update({
      'FriendsId': FieldValue.arrayRemove([friendIdToRemove]),
      'friendsName': FieldValue.arrayRemove([friendNameToRemove]),
    });


    // Do something with the arrays
    // print('Friends Id: $friendsId');
    // print('Friends Name: $friendsName');
  } catch (e) {
    print('Error getting values: $e');
  }
}




