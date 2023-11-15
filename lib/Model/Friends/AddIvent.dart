import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mychats/Model/Notification/Notoficat.dart';
import 'package:mychats/Model/untils/nameSurname.dart';

Future<String> addIvent(String friendUserId, String friendName) async {
  final currentUser = FirebaseAuth.instance.currentUser;
  NotificationHandler fmass = NotificationHandler();
  if (currentUser != null) {
    final currentUserId = currentUser.uid;
    final Name = await getUserName();
    print("Name $Name");

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(friendUserId)
          .collection('ivent')
          .doc('ivent')
          .set({
        'FriendsId': FieldValue.arrayUnion([currentUser.uid]),
        'friendsName': FieldValue.arrayUnion([Name]),
      });
      fmass.sendNotificationToUser(friendUserId, 'Заявка в друзья', '$friendName, Просится к Вам в друзья!');
      return 'User $friendUserId added to friends and ivent with name $friendName.';
    } catch (error) {
      return 'Error adding friend: $error';
    }
  } else {
    return 'Current user is null.';
  }
}