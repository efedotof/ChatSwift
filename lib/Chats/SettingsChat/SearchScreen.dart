import 'package:flutter/material.dart';

import '../../HomeScreen/WidgetsToSTF/Search.dart';

class SearchScreens extends StatefulWidget {
  const SearchScreens({super.key});

  @override
  State<SearchScreens> createState() => _SearchScreensState();
}

class _SearchScreensState extends State<SearchScreens> {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(width: MediaQuery.of(context).size.width * 0.67,child: const Search()),

      ),
      backgroundColor: Theme.of(context).primaryColor,
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
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}