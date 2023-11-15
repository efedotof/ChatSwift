import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mychats/Model/Notification/Notoficat.dart';

import 'MessageCards.dart';
import 'SettingsChat/SendPanel.dart';
import 'SettingsChat/SettingsChats.dart';


class ChatPages extends StatefulWidget {
  const ChatPages({Key? key, required this.friendUserId, required this.name}) : super(key: key);
  
  final String friendUserId;
  final String name;

  @override
  State<ChatPages> createState() => _ChatPagesState();
}

class _ChatPagesState extends State<ChatPages> with TickerProviderStateMixin {
  bool isStart = true;
  NotificationHandler fmass = NotificationHandler();


  ScrollController _scrollController = ScrollController();
  final user = FirebaseAuth.instance.currentUser;
  final TextEditingController _messageController = TextEditingController();

   Future<void> sendMessage(String messageText, bool isImage, bool isAudio) async {
    final currentUserId = user!.uid;
    final friendUserId = widget.friendUserId;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .collection('friends')
          .doc(friendUserId)
          .update({
        'chats.$friendUserId.messages': FieldValue.arrayUnion([
          {
            'text': messageText,
            'isMyMessage': true,
            'isImage':isImage,
            'isAudio':isAudio
          },
        ]),
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(friendUserId)
          .collection('friends')
          .doc(currentUserId)
          .update({
        'chats.$currentUserId.messages': FieldValue.arrayUnion([
          {
            'text': messageText,
            'isMyMessage': false,
            'isImage':isImage,
            'isAudio':isAudio
          },
        ]),
      });
      await fmass.sendNotificationToUser(friendUserId, 'Новое сообщение', "$messageText");
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    } catch (error) {
      print('Error sending message: $error');
    }
    _messageController.clear();
  }
  
  
  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
           IconButton(
            onPressed: () {
             _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
            },
            icon: const Icon(Icons.arrow_downward),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingChats(friendsuid: widget.friendUserId,)),
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
        title: Text(
          widget.name,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.black.withOpacity(0.2),
            height: 1,
          ),
          preferredSize: Size.fromHeight(1),
        ),
      ),
        backgroundColor: Theme.of(context).primaryColor,
      body: Column(
      children: [
        Expanded(
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user!.uid)
                .collection('friends')
                .doc(widget.friendUserId)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.05,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final document = snapshot.data;
              if (document!.exists) {
                final chatData =
                    document['chats'][widget.friendUserId] as Map<String, dynamic>;
                final messagesList = chatData['messages'] as List<dynamic>;

                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                });

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    final messageText = messagesList[index]['text'] as String;
                    final ItsMyMessage =
                        messagesList[index]['isMyMessage'] as bool;
                    final IsImage = messagesList[index]['isImage'] as bool;
                    final IsAudi = messagesList[index]['isAudio'] as bool;

                    return MessageCards(
                      text: messageText,
                      isMyMessage: ItsMyMessage,
                      isImage: IsImage,
                      isAudio: IsAudi,
                    );
                  },
                );
              } else {
                return Text('Документ не существует');
              }
            },
          ),
        ),
        SendPanel(
          onSendMessage: (messageText) {
            sendMessage(messageText, false, false);
          },
          controller: _messageController,
          friendsUid: widget.friendUserId,
          uid: user!.uid,
        ),
      ],
    ),
  );
}
}