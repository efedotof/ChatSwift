
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mychats/Model/Auth/AutoLogin.dart';

import '../LoginScreen/Login.dart';
import '../Registration/Registration.dart';
import 'AdditionScreens/Button/ButtonLogin.dart';
import 'AdditionScreens/Button/ButtonRegistration.dart';
import 'AdditionScreens/HeadingText.dart';
import 'AdditionScreens/LabelText.dart';


class DefiningPage extends StatefulWidget {
  const DefiningPage({super.key});

  @override
  State<DefiningPage> createState() => _DefiningPageState();
}

class _DefiningPageState extends State<DefiningPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autoSignInWithEmailAndPass(context);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 30,
            ),

            Container(
              child: Column(
                children: [
                   
                  const SizedBox(height: 20,),
                  HeadingText(text: "Опа....Опа...\nЭто кто тут такой ?"),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                        child: LabelText(
                            text:
                               "Ты думаешь, что ты пуп Земли \n Но на деле ты ничто...")),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 1.12,
                      child: ButtonRegistration(
                          text:  'Создать аккаунт', onPressed: (){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Registration()),
              );})),
                  const SizedBox(height: 20,),
                  Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 1.12,
                  child: ButtonLogin(text:  'Войти', onPressed: (){
                    
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
                  })),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}



/**********************************************/
/* Это интуитивное мобильное приложение для чтения и публикации книг. Откройте мир литературы прямо с вашего устройства, где бы вы ни находились. С легкостью загружайте и читайте свои любимые книги из памяти устройства в различных форматах. */
/* © 2023 BookVerse. Все права защищены. */
/**********************************************/