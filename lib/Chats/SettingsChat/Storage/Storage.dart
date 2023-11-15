import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mychats/Chats/SettingsChat/Storage/AssetThumbnail.dart';
import 'package:mychats/Chats/SettingsChat/Storage/File.dart';
import 'package:mychats/Chats/SettingsChat/Storage/Gallery.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class Storage extends StatefulWidget {
  const Storage({super.key, required this.friendsUid, required this.uid});
  final String friendsUid;
  final String uid;
  @override
  State<Storage> createState() => _StorageState();
    static _StorageState? of(BuildContext context) {
    return context.findAncestorStateOfType<_StorageState>();
  }



}

class _StorageState extends State<Storage> {
  List<AssetEntity> assets = [];
  List<AssetEntity> selectedAssets = [];
  final controller = ScrollController();
  int loadedAssetsCount = 0;
  int batchSize = 3;
  double maxSize = 0.5;
  int _currentIndex = 0;
  final textEditingController = TextEditingController();

   bool elementsAreSelected() {
    return selectedAssets.isNotEmpty;
  }
  void handleSendButtonClick() {
    String enteredText = textEditingController.text;
    setState(() {
      textEditingController.clear();
      selectedAssets.clear();
    });
    Navigator.pop(context);
  }



  Future<void> sendMessage(String messageText, bool isImage, bool isAudio) async {
    final currentUserId = widget.uid;
    final friendUserId = widget.friendsUid;

    try {
      // Добавляем сообщение к чату в базе данных
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .collection('friends')
          .doc(friendUserId)
          .update({
        'chats.$friendUserId.messages': FieldValue.arrayUnion([
          {
            'text': messageText,
            'isMyMessage': true,
            'isImage':isImage,
            'isAudio':isAudio
          },
        ]),
      });

      // Добавляем сообщение к чату другого пользователя в базе данных
      await FirebaseFirestore.instance
          .collection('users')
          .doc(friendUserId)
          .collection('friends')
          .doc(currentUserId)
          .update({
        'chats.$currentUserId.messages': FieldValue.arrayUnion([
          {
            'text': messageText,
            'isMyMessage': false,
            'isImage':isImage,
            'isAudio':isAudio,
          },
        ]),
      });
    } catch (error) {
      print('Error sending message: $error');
    }
  }




Future<void> uploadImages(AssetEntity selectedAssets) async {
  try {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageReference = storage.ref().child('images');

      Uint8List? imageData = await selectedAssets.originBytes;

      if (imageData != null) {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        String fileExtension = "jpg"; // Change this to the actual file extension

        // Get the file extension from the asset
        List<String> pathSegments = selectedAssets.title!.split('.');
        String assetFileExtension = pathSegments.isNotEmpty ? pathSegments.last : 'jpg';

        // Specify content type based on the asset's file extension
        SettableMetadata metadata = SettableMetadata(
          contentType: 'image/$assetFileExtension',
        );

        UploadTask uploadTask = storageReference
            .child('$fileName.$fileExtension')
            .putData(imageData, metadata);

        TaskSnapshot taskSnapshot = await uploadTask;

        if (taskSnapshot.state == TaskState.success) {
          String imageUrl = await taskSnapshot.ref.getDownloadURL();
          print('Image uploaded successfully. URL: $imageUrl');
          sendMessage(imageUrl, true, false);
        } else {
          print('Image upload failed.');
        }
      }
    
  } catch (error) {
    print('Error uploading images: $error');
  }
}



  void handleSelectionChange(AssetEntity asset, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedAssets.add(asset);
        print("selectedAssets $selectedAssets");
      } else {
        selectedAssets.remove(asset);
        print("selectedAssets $selectedAssets");
      }
    });
  }

  List<Widget> page = [
    Gallery(),
    File()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          flexibleSpace: Container(
            child: Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 3.0,
                  width: MediaQuery.of(context).size.width * 0.1,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFFBBC2CB)
                          : const Color(0xFF7A7C91)).withOpacity(0.3),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Display the current page
            page[_currentIndex],

            // Display text field and send button if elements are selected
            if (elementsAreSelected())
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                       Expanded(
            child: Container(
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
              child: TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: 'Введите сообщение...',
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                maxLines: null,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () async {
              for(int i = 0; i < selectedAssets.length; i ++){
               await uploadImages(selectedAssets[i]);
              }
              handleSendButtonClick();
            },
            child: Container(
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Center(
                child: Column(
                  children: [
                    Icon(Icons.arrow_upward,color: Theme.of(context).primaryColor),
                    Text('${selectedAssets.length}'),
                  ],
                ),
              ),
            ),
          ),
                    ],
                  ),
                ), 
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Галерея',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Файлы',
          ),
        ],
      ),
    );
  }
}
