import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychats/Model/untils/nameSurname.dart';
import 'package:mychats/ivent/CardsToNotif.dart';


class NotificationScreens extends StatefulWidget {
  const NotificationScreens({super.key});

  @override
  State<NotificationScreens> createState() => _NotificationScreensState();
}

class _NotificationScreensState extends State<NotificationScreens> {
   final user = FirebaseAuth.instance.currentUser;
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).primaryColor,
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text('Уведомления', style: Theme.of(context).primaryTextTheme.bodyText1),
    ),
    body: StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('ivent')
          .doc('ivent')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,child: Center(child: Text('No data available', style: Theme.of(context).primaryTextTheme.bodyText1)));
        }

        List<dynamic>? friendsId = snapshot.data!.get('FriendsId');
        List<dynamic>? friendsName = snapshot.data!.get('friendsName');

        if (friendsId != null && friendsName != null && friendsId.isNotEmpty && friendsName.isNotEmpty) {
  return SingleChildScrollView(
    child: Wrap(
      children: List.generate(
        friendsId.length,
        (index) => CardsNotification(
          name: friendsName[index],
          frienduid: friendsId[index]
        ),
      ),
    ),
  );
} else {
  return Center(child: Container(width: MediaQuery.of(context).size.width * 0.8,height: MediaQuery.of(context).size.height * 0.8, decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),child: Center(child: Text('Тут пока что пусто', style: Theme.of(context).primaryTextTheme.bodyText1))));
}
      },
    ),
  );
}
}