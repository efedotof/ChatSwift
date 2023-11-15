import 'package:flutter/material.dart';
import 'package:mychats/ThemeMyApp/CustomTheme.dart';
import 'package:mychats/ThemeMyApp/config.dart';


class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal info',
                    style: TextStyle(
                        color:
                            currentTheme.currentTheme == CustomTheme.darkTheme
                                ? const Color(0xFF6F6F6F)
                                : const Color(0xFF6F6F6F),
                        fontSize: 23,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue, // Цвет границы
                          width: 1.0, // Ширина границы
                        ),
                        borderRadius:
                            BorderRadius.circular(8.0), // Закругленные углы
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.border_color,
                            size: 15,
                            color: currentTheme.currentTheme ==
                                    CustomTheme.darkTheme
                                ? const Color(0xFF6F6F6F)
                                : const Color(0xFF6F6F6F),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Edit',
                            style: TextStyle(
                                color: currentTheme.currentTheme ==
                                        CustomTheme.darkTheme
                                    ? const Color(0xFF6F6F6F)
                                    : const Color(0xFF6F6F6F),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full name',
                      style: TextStyle(
                          color:
                              currentTheme.currentTheme == CustomTheme.darkTheme
                                  ? const Color(0xFF6F6F6F).withOpacity(0.8)
                                  : const Color(0xFF6F6F6F).withOpacity(0.8),
                          fontSize: 19,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Name Surname Patronymic',
                      style: TextStyle(
                          color:
                              currentTheme.currentTheme == CustomTheme.darkTheme
                                  ? const Color(0xFF6F6F6F)
                                  : const Color(0xFF6F6F6F),
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                          color:
                              currentTheme.currentTheme == CustomTheme.darkTheme
                                  ? const Color(0xFF6F6F6F).withOpacity(0.8)
                                  : const Color(0xFF6F6F6F).withOpacity(0.8),
                          fontSize: 19,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'example@email.com',
                      style: TextStyle(
                          color:
                              currentTheme.currentTheme == CustomTheme.darkTheme
                                  ? const Color(0xFF6F6F6F)
                                  : const Color(0xFF6F6F6F),
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone',
                      style: TextStyle(
                          color:
                              currentTheme.currentTheme == CustomTheme.darkTheme
                                  ? const Color(0xFF6F6F6F).withOpacity(0.8)
                                  : const Color(0xFF6F6F6F).withOpacity(0.8),
                          fontSize: 19,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '+7000000000',
                      style: TextStyle(
                          color:
                              currentTheme.currentTheme == CustomTheme.darkTheme
                                  ? const Color(0xFF6F6F6F)
                                  : const Color(0xFF6F6F6F),
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Birthdate',
                      style: TextStyle(
                          color:
                              currentTheme.currentTheme == CustomTheme.darkTheme
                                  ? const Color(0xFF6F6F6F).withOpacity(0.8)
                                  : const Color(0xFF6F6F6F).withOpacity(0.8),
                          fontSize: 19,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '20/09/21',
                      style: TextStyle(
                          color:
                              currentTheme.currentTheme == CustomTheme.darkTheme
                                  ? const Color(0xFF6F6F6F)
                                  : const Color(0xFF6F6F6F),
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
