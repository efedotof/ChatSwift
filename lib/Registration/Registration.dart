import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mychats/Definingpage/AdditionScreens/Button/ButtonRegistration.dart';
import 'package:mychats/HomeScreen/Home.dart';
import 'package:mychats/Model/Auth/AutoLogin.dart';
import 'package:mychats/Registration/PageView/PasswordPage.dart';

import 'package:mychats/Registration/PageView/RePasswordPage.dart';
import '../Model/Auth/Registration.dart';
import 'PageView/AgreementPage.dart';
import 'PageView/BirthdatePage.dart';
import 'PageView/NamePage.dart';
import 'PageView/NumberPhonePage.dart';
import 'PageView/SurnamePage.dart';
import 'widgets/CustomProgress.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController myNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController patronymicController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  int currentPage = 1;
  final int totalPages = 7; // Общее количество страниц

  final PageController controller = PageController();

  AuthService authService = AuthService();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomProgressBar(
              currentPage: currentPage,
              totalPages: totalPages,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.77,
              child: PageView(
                  controller: controller,
                  physics:
                      const NeverScrollableScrollPhysics(), // Запретить свайп
                  children: [
                    NamePage(
                      nameController: myNameController,
                    ),
                    SurnamePage(
                      nameController: surnameController,
                    ),
                    NumberPhonePage(
                      nameController: numberController,
                    ),
                    BirthdatePage(
                      nameController: birthdateController,
                    ),
                    PasswordPage(nameController: passwordController),
                    RePasswordPage(
                      nameController: repasswordController,
                    ),
                    const AgreementPage(),
                  ]),
            ),
           Padding(
  padding: const EdgeInsets.all(10.0),
  child: Container(
    height: MediaQuery.of(context).size.height / 15,
    width: MediaQuery.of(context).size.width / 1.3,
    child: ButtonRegistration(
      text: "Продолжить",
      onPressed: () {
        setState(() {
          bool canNavigate = true;

          if (currentPage == 1) {
            // Check if the controller for the first page is not empty
            canNavigate = myNameController.text.isNotEmpty;
          } else if (currentPage == 2) {
            // Check if the controller for the second page is not empty
            canNavigate = surnameController.text.isNotEmpty;
          } else if (currentPage == 3) {
            // Check if the controller for the third page is not empty
            canNavigate = numberController.text.isNotEmpty;
          } else if (currentPage == 4) {
            // Check if the controller for the fifth page is not empty
            canNavigate = birthdateController.text.isNotEmpty;
          } else if (currentPage == 5) {
            canNavigate = passwordController.text.isNotEmpty;
          } else if (currentPage == 6) {
            // Check if the controller for the seventh page is not empty
            
            if((passwordController.text == repasswordController.text) && repasswordController.text.isNotEmpty){
              canNavigate = true;
            }else{
              canNavigate = false;
              print(passwordController.text);
              print(repasswordController.text);
              print(repasswordController.text.isNotEmpty);
            }
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
              saveCredentialsToSharedPreferences(numberController.text,passwordController.text);
              authService.registerUser(
                myNameController.text,
                surnameController.text,
                numberController.text,
                birthdateController.text,
                passwordController.text,
                context
              );
              
            }
          }
        });
      },
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}
