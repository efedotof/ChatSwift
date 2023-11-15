import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addFriend(String currentName, String friendUserId, String friendName) async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    final currentUserId = currentUser.uid;
    try {
      // Add friend to current user's friends collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .collection('friends')
          .doc(friendUserId)
          .set({
        'name': friendName,
        'chats': {
          friendUserId: {
            'members': [currentUserId, friendUserId],
            'messages': []
          }
        }
      });

      // Add current user to friend's friends collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(friendUserId)
          .collection('friends')
          .doc(currentUserId)
          .set({
        'name': currentName,
        'chats': {
          currentUserId: {
            'members': [currentUserId, friendUserId],
            'messages': [] 
          }
        }
      });
    } catch (error) {
      print('Error adding friend and creating chat: $error');
    }
  }
}