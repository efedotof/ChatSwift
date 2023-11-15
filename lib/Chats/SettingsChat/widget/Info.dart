import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';



import 'MyCheckbox.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckBoxCustomItemMenu(text: 'Уведомления',),
          GestureDetector(
            onTap: (){
              Share.text('Привет, друзья!', 'Я нашел удивительную книгу, которая, безусловно, вас заинтересует!Книга называется [Название книги] и написана [Имя автора]. Это захватывающая история, которая рассказывает о [краткое описание сюжета или темы книги]. Я уверен(а), что она вас поразит и принесет немало удовольствия.Вы можете прочитать эту книгу в [название приложения с книгами], где она доступна для скачивания. Просто воспользуйтесь ссылкой ниже, чтобы перейти к книге:[Вставьте ссылку на книгу в приложении]Я уверен(а), что вы найдете в этой книге что-то особенное, что вас вдохновит и заставит задуматься. Давайте поделимся впечатлениями после прочтения!Приятного чтения!', 'text/plain');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: Text('Поделиться', style:  Theme.of(context).primaryTextTheme.bodyText1),
            ),
          ),
          
          GestureDetector(
            child: Padding(
             padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: Text('Удалить чат', style:  Theme.of(context).primaryTextTheme.bodyText1),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: Text('Очистить медиа', style:  Theme.of(context).primaryTextTheme.bodyText1),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: Text('Заблокировать', style:  TextStyle(color: Color(0xFFF5978C),fontSize: 20,)),
            ),
          ),
        ],
      ),
    );
  }
}
