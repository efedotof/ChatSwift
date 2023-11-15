import 'package:flutter/material.dart';

import 'PageVi/File/File.dart';
import 'PageVi/Pick/Pick.dart';
import 'PageVi/Video/Video.dart';
import 'PageVi/Voice/VoiceMessage.dart';

class Nedia extends StatefulWidget {
  const Nedia({super.key});

  @override
  State<Nedia> createState() => _NediaState();
}

class _NediaState extends State<Nedia> {
  final PageController controller = PageController();
  int currentPage = 0;

  List<String> charts = [
    'Изображения',
    "Файлы",
    "Голосовые сообщения",
    "Видео"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(charts.length, (index) {
                return GestureDetector(
                  onTap: () {
                    controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    setState(() {
                      currentPage = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(charts[index],
                            style:
                                Theme.of(context).primaryTextTheme.bodyText1),
                        const SizedBox(
                          height: 3,
                        ),
                        currentPage == index
                            ? Container(
                                height: 3,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Theme.of(context).indicatorColor,
                                ),
                              )
                            : Container(
                                height: 3,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.transparent,
                                ),
                              )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: const <Widget>[
                PickGrid(),
                FileGrid(),
                VoiceMessagesGrid(),
                Video(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
