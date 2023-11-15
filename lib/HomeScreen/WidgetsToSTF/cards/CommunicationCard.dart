import 'package:flutter/material.dart';
import 'package:mychats/Chats/ChatsPage.dart';
import 'package:mychats/Chats/SettingsChat/SettingsChats.dart';

class CommunicationCard extends StatefulWidget {
  const CommunicationCard(
      {super.key, required this.name, required this.message, required this.uid, required this.friendUserId});
  final String name;
  final String message;
  final String uid;
  final String friendUserId;

  @override
  State<CommunicationCard> createState() => _CommunicationCardState();
}

class _CommunicationCardState extends State<CommunicationCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPages(name: widget.name, friendUserId: widget.friendUserId,)),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(
                    width:
                        8.0), 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment:
                          Alignment.center, // Выравниваем текст по центру
                      child: Text(
                        widget.name,
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.message,
                          style: Theme.of(context).primaryTextTheme.bodyText2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingChats(friendsuid: widget.friendUserId,)),
                );
              },
              child:
                  Icon(Icons.more_horiz, color: Theme.of(context).focusColor),
            )
          ],
        ),
      ),
    );
  }
}
