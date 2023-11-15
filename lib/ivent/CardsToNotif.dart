import 'package:flutter/material.dart';
import 'package:mychats/Model/Friends/Friends.dart';
import 'package:mychats/Model/Friends/removeIvent.dart';
import 'package:mychats/Model/untils/nameSurname.dart';

class CardsNotification extends StatefulWidget {
  const CardsNotification({super.key, required this.name, required this.frienduid});
  final String name;
  final String frienduid;



  @override
  State<CardsNotification> createState() => _CardsNotificationState();
}

class _CardsNotificationState extends State<CardsNotification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                        
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                         shape: BoxShape.circle
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.width * 0.2,
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name, style: Theme.of(context).primaryTextTheme.bodyText1,),
                          Text('Заявка в друзья', style: Theme.of(context).primaryTextTheme.bodyText2)
                        ],
                      ),
              ],
            ),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                           String name = await getUserName();
                            addFriend(name,widget.frienduid,widget.name);
                            removeFromArrays(widget.frienduid, widget.name);
                       
                        },
                        child: Icon(Icons.check,  color: (Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFFBBC2CB)
                              : const Color(0xFF7A7C91)) ,),
                      ),
                       GestureDetector(
                        onTap: () async {
                            await removeFromArrays(widget.frienduid, widget.name);
                                                   
                         
                        },
                        child: Icon(Icons.clear,  color: (Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFFBBC2CB)
                              : const Color(0xFF7A7C91)) ,),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}



//регистрация пользователя добавление коллекции ivent/ivent в нем два массива  FriendsId и friendsName
