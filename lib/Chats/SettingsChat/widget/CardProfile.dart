import 'package:flutter/material.dart';
import 'package:mychats/Model/SettingsChats/SettingChat.dart';
import 'package:mychats/Model/untils/uid.dart';

class CardProfile extends StatefulWidget {
  const CardProfile({super.key, required this.friendsUID});
  final String friendsUID;
  @override
  State<CardProfile> createState() => _CardProfileState();
}

class _CardProfileState extends State<CardProfile> {
  @override
Widget build(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    height: MediaQuery.of(context).size.height * 0.1,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: FutureBuilder<String>(
      future: getFriendName(widget.friendsUID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Выводим результат в UI
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(7),
                ),
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshot.data!, style: Theme.of(context).primaryTextTheme.bodyText1,),
                  Container(width:  MediaQuery.of(context).size.width * 0.5,child: Text(widget.friendsUID,maxLines: 1,style: Theme.of(context).primaryTextTheme.bodyText2)), // Вместо 'id'
                ],
              )
            ],
          );
        } else {
          return Text('No data available');
        }
      },
    ),
  );
}
}