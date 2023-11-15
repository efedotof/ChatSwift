import 'package:flutter/material.dart';
import 'package:mychats/Model/Notification/Notoficat.dart';
import 'package:mychats/Scanner/ScannerQr.dart';
import 'package:mychats/ivent/Ivent.dart';
import '../SettingsPage/Setting.dart';
import 'AdditionScreens/Communication.dart';
import 'WidgetsToSTF/Search.dart';




class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const Communication(),
    const SettingMenuPages(),

  ];






  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
  
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar:  AppBar(
          title: Text('Главная',style: Theme.of(context).primaryTextTheme.bodyText1),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
     Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationScreens()),
              );
    
              },
              icon: const Icon(Icons.person),
            ),




            IconButton(
              onPressed: () {
     Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScannerQr()),
              );
    
              },
              icon: const Icon(Icons.flip),
            ),
           
          ],
        ),
        body: _screens[_currentIndex],
    
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, 
          
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
        
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.chrome_reader_mode),
              label: 'Общение',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'Настройки',
            ),
          ])    
      ),
    );
  }
}


