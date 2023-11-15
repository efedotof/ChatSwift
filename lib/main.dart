import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mychats/Definingpage/DefiningPage.dart';
import 'package:mychats/Model/Notification/Notoficat.dart';
import 'package:mychats/ThemeMyApp/CustomTheme.dart';
import 'package:mychats/ThemeMyApp/config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mychats/firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
await NotificationHandler().initialize();
  await CustomTheme().loadTheme();
  runApp( MyApp()
    );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {
      });
    });
  }
  @override
  Widget build(BuildContext context) {
       SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: currentTheme.currentTheme == ThemeMode.dark
      ? CustomTheme.darkTheme.primaryColor
      : CustomTheme.lightTheme.primaryColor,
));
        return MaterialApp(
          theme: CustomTheme.lightTheme,
          darkTheme: CustomTheme.darkTheme,
          themeMode: currentTheme.currentTheme,
          initialRoute:  '/Registration',
          routes: {
            '/Registration': (context) => const DefiningPage(),
  
          },
          debugShowCheckedModeBanner: false,  
    );
  }
}









  



