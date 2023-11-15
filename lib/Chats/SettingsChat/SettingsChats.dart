import 'package:flutter/material.dart';
import 'SearchScreen.dart';
import 'widget/CardProfile.dart';
import 'widget/Info.dart';
import 'widget/Media.dart';

class SettingChats extends StatefulWidget {
  const SettingChats({super.key, required this.friendsuid});
  final String friendsuid;
  @override
  State<SettingChats> createState() => _SettingChatsState();
}

class _SettingChatsState extends State<SettingChats> {
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
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreens()),
              );
          }, icon: Icon(Icons.search))
        ],
        title: const Text('Информация'),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardProfile(friendsUID: widget.friendsuid,),
             Padding(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: Divider(
                   color: (Theme.of(context).brightness == Brightness.dark
                                ? const Color(0xFFBBC2CB)
                                : const Color(0xFF7A7C91)).withOpacity(0.3), 
                  height: 20,
                  thickness: 1, 
                )),
            const Info(),
             Padding(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: Divider(
                  color: (Theme.of(context).brightness == Brightness.dark
                                ? const Color(0xFFBBC2CB)
                                : const Color(0xFF7A7C91)).withOpacity(0.3), 
                  height: 20,
                  thickness: 1, 
                )),
            Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height * 0.89,child: const Nedia()),
          ],
        ),
      ),
    );
  }
}