import 'package:flutter/material.dart';
import 'package:mychats/ThemeMyApp/CustomTheme.dart';
import 'package:mychats/ThemeMyApp/config.dart';


class BioChange extends StatefulWidget {
  const BioChange({super.key});

  @override
  State<BioChange> createState() => _BioChangeState();
}

class _BioChangeState extends State<BioChange> {
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
                    'Bio',
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
                child: Text('Eiusmod ad in irure tempor ut id deserunt nisi sint eiusmod laboris esse. Consequat commodo ullamco esse adipisicing velit. Culpa non proident non labore culpa do. Excepteur cupidatat aliqua et dolor. Veniam nulla cupidatat duis aliqua proident officia exercitation in Lorem cupidatat amet est tempor tempor. Duis tempor dolor nostrud esse cillum esse dolor consequat velit laborum irure. Cupidatat nisi aliquip consectetur tempor officia sunt tempor reprehenderit reprehenderit.' , style: TextStyle(
                          color:
                              currentTheme.currentTheme == CustomTheme.darkTheme
                                  ? const Color(0xFF6F6F6F)
                                  : const Color(0xFF6F6F6F),
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
              ),
            ],
          )),
    );
  }
}