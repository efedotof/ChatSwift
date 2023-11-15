
import 'package:flutter/material.dart';
import 'package:mychats/Definingpage/AdditionScreens/Button/ButtonRegistration.dart';
import 'package:mychats/HomeScreen/Home.dart';
import 'package:mychats/LoginScreen/Page/NumberAndPassword/PasswordPage.dart';
import 'package:mychats/LoginScreen/widgets/NumberPhonePage.dart';
import 'package:mychats/Model/Auth/AutoLogin.dart';
import 'package:mychats/Model/Auth/Login.dart';



class LoginIsUsingYourNumberAndPassword extends StatefulWidget {
  const LoginIsUsingYourNumberAndPassword({super.key});

  @override
  State<LoginIsUsingYourNumberAndPassword> createState() => _LoginIsUsingYourNumberAndPasswordState();
}

class _LoginIsUsingYourNumberAndPasswordState extends State<LoginIsUsingYourNumberAndPassword> {
  int currentPage = 1;
final int totalPages = 2; 
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthLoginService authService = AuthLoginService();

   final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(), 
              children:[
                NumberPhonePage(controller: email,), PasswordPage(controller: password,),
              ]
            ),
          ),
         Container(
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.3,
      child: ButtonRegistration(
      text: "Продолжить",
      onPressed: () async {
       setState(() {
          bool canNavigate = true;

          if (currentPage == 1) {
            canNavigate = email.text.isNotEmpty;
          } else if (currentPage == 2) {
            canNavigate = password.text.isNotEmpty;
          }

          if (canNavigate) {
            if (currentPage < totalPages) {
              currentPage += 1;
              if (currentPage >= totalPages) {
                currentPage = totalPages;
              }
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            } else {
              saveCredentialsToSharedPreferences(email.text,password.text);
              authService.signInWithEmailAndPassword(
                context,
                email.text,
                password.text,
              );
              
            }
          }
        });
      },
      ),
    ),
        ],
      ),
    ),
    );
  }
}
