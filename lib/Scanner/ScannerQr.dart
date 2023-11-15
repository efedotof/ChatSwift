
import 'package:flutter/material.dart';

import 'ScannerInput.dart';
import 'ScannerOutput.dart';


class ScannerQr extends StatefulWidget {
  const ScannerQr({super.key});

  @override
  State<ScannerQr> createState() => _ScannerQrState();
}

class _ScannerQrState extends State<ScannerQr> {

  int _currentIndex = 0;
  
 


  final List<Widget> _screens = [
    const ScannerInput(),
    const ScannerOutput(),
  ];


  List<String> nameSpasingToChat = ['Показать', 'Сканировать'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,leading: IconButton(
    icon: const Icon(Icons.chevron_left), // Замените "new_icon" на иконку, которую вы хотите использовать
    onPressed: () {
      Navigator.pop(context);
    },
    
  ),
  title: Text('TitleOnScanntoScannerQr', style:Theme.of(context).primaryTextTheme.bodyText1),
  
  
  ),
  body: Column(
    
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
              nameSpasingToChat.length,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: Column(
                        
                        children: [
                          Text(nameSpasingToChat[index], style: Theme.of(context).primaryTextTheme.bodyText1,),
                          _currentIndex == index
                              ? Container(
                                  height: 3,
                                  width:  MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Theme.of(context).indicatorColor,
                                  ),
                                )
                              : Container(
                                  height: 3,
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                  ),
                                )
                        ],
                      )),
                )),
      ),
      Container(width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8 ,child: _screens[_currentIndex]),
    ],
  ),
    );
  }
}