import 'package:flutter/material.dart';
import 'package:mychats/ThemeMyApp/CustomTheme.dart';
import 'package:mychats/ThemeMyApp/config.dart';


class AgreementPage extends StatefulWidget {
  const AgreementPage({super.key});

  @override
  State<AgreementPage> createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
bool isPrivacyPolicyChecked = false;
  bool isTermsOfUseChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Для продолжения, пожалуйста, согласитесь с политикой конфиденциальности и правилами использования.',
              style: TextStyle(
                color: currentTheme.currentTheme == CustomTheme.darkTheme
                    ? const Color(0xFF6F6F6F)
                    : const Color(0xFF6F6F6F),
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
                
              ),
              child: CheckboxListTile(
              value: isPrivacyPolicyChecked,
              onChanged: (value) {
                setState(() {
                  isPrivacyPolicyChecked = value!;
                });
              },
              title: Text(
                'Я согласен с политикой конфиденциальности.',
                style: TextStyle(
                  color: currentTheme.currentTheme == CustomTheme.darkTheme
                      ? const Color(0xFF6F6F6F)
                      : const Color(0xFF6F6F6F),
                ),
              ),
            ),
              
            ),
             Container(
              
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
                
              ),
              child:
              CheckboxListTile(
              value: isTermsOfUseChecked,
              onChanged: (value) {
                setState(() {
                  isTermsOfUseChecked = value!;
                });
              },
              title: Text(
                'Я согласен с правилами использования.',
                style: TextStyle(
                  color: currentTheme.currentTheme == CustomTheme.darkTheme
                      ? const Color(0xFF6F6F6F)
                      : const Color(0xFF6F6F6F),
                ),
              ),
            ),
              
              ),
            
          ],
        ),
      ),
    );
  }
}