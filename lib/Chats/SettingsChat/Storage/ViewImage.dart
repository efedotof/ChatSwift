import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ViewImages extends StatefulWidget {
  const ViewImages({super.key, required this.text});
  final String text;

  @override
  State<ViewImages> createState() => _ViewImagesState();
}

class _ViewImagesState extends State<ViewImages> {
  late Future<void> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
  }

  Future<void> loadImage() async {
    // Здесь вы можете добавить ваш код загрузки изображения
    // Например, используйте Image.network для загрузки из сети
    // или Image.file для загрузки из файловой системы

    // Замените этот блок кода на вашу реальную логику загрузки изображения
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7), // Затемненный фон
        body: Center(
            child: Stack(children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(
                  context); // Обработка нажатия на фон для закрытия окна
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(
                    context); // Закрытие окна по нажатию кнопки "назад"
              },
            ),
          ),
          Center(
            child: FutureBuilder(
              future: _imageFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Image.network(
                    widget.text,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.8,
                    fit: BoxFit.cover,
                  );
                }
              },
            ),
          )
        ])));
  }
}
