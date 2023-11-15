import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychats/HomeScreen/WidgetsToSTF/cards/CommunicationCard.dart';



class Communication extends StatefulWidget {
  const Communication({super.key});

  @override
  State<Communication> createState() => _CommunicationState();
}

class _CommunicationState extends State<Communication> {

  final user = FirebaseAuth.instance.currentUser;

@override
Widget build(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('friends')
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }

      final friendData = snapshot.data!.docs;

      return SingleChildScrollView(
        child: Column(
          children: friendData.map((friendDoc) {
            final friendUID = friendDoc.id;

            if (friendDoc.data() != null) {
              final friendName = friendDoc['name'] ?? '';

              return Padding(
                padding: EdgeInsets.all(8.0),
                child: CommunicationCard(name: friendName, message: 'Hello', uid: friendUID, friendUserId: friendUID,),
              );
            } else {
              return Container();
            }
          }).toList(),
        ),
      );
    },
  );
}
}