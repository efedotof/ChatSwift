import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mychats/Chats/SettingsChat/Storage/Storage.dart';
import 'package:mychats/Chats/SettingsChat/soundrecorder.dart';
import 'package:mychats/Model/Notification/Notoficat.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';



class SendPanel extends StatefulWidget {
  const SendPanel(
      {Key? key,
      required this.onSendMessage,
      required this.controller,
      required this.friendsUid,
      required this.uid})
      : super(key: key);

  final Function(String) onSendMessage;
  final TextEditingController controller;
  final String friendsUid;
  final String uid;
  @override
  State<SendPanel> createState() => _SendPanelState();
}

class _SendPanelState extends State<SendPanel> with TickerProviderStateMixin {
  TextEditingController text = TextEditingController();
  bool _isFilePickerActive = false;
  double _containerHeight = 100.0;
  late AnimationController _controller;
  SoundRecorder records = SoundRecorder();
  NotificationHandler Fmess = NotificationHandler();

  
  Future<void> sendMessage(String messageText, bool isImage, bool isAudio) async {
    final currentUserId = widget.uid;
    final friendUserId = widget.friendsUid;
    try {
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
            'isAudio':isAudio
          },
        ]),
      });


   await Fmess.sendNotificationToUser(friendUserId, 'Новое сообщение', messageText);

    } catch (error) {
      print('Error sending message: $error');
    }
  }





Future<void> sendAudioMessage(File audioFile) async {
  try {
    final storageReference = FirebaseStorage.instance.ref().child('audio/${DateTime.now()}.aac');
    await storageReference.putFile(audioFile);

    final downloadUrl = await storageReference.getDownloadURL();
    setState(() {
    });
    await sendMessage(downloadUrl, false, true);
  } catch (e) {
    print('Error uploading audio: $e');
  }
}

Future<void> _startRecording() async {
  await records.toggleRecording();
}

Future<void> _stopRecording() async {
  await records.toggleRecording();

  // Get the app's document directory
  Directory appDocDir = await getApplicationDocumentsDirectory();

  // Create the file in the document directory
  File audioFile = File('${appDocDir.path}/audi_example.aac');

  // Check if the file exists before attempting to upload
  if (audioFile.existsSync()) {
    await sendAudioMessage(audioFile);
  } else {
    print('Error: Audio file does not exist.');
  }
}




  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 200),
    );
    records.init();
    Fmess.initialize();
      
  }

 

  void _attachFile() async {
    double maxSheetHeight = MediaQuery.of(context).size.height * 0.8;
    double initialContainerHeight = MediaQuery.of(context).size.height * 0.6;
    double minContainerHeight = MediaQuery.of(context).size.height * 0.1;

    _containerHeight = initialContainerHeight;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  _containerHeight -= details.primaryDelta!;
                  if (_containerHeight < 0) {
                    _containerHeight = 0;
                  } else if (_containerHeight > maxSheetHeight) {
                    _containerHeight = maxSheetHeight;
                  }
                  if (_containerHeight < minContainerHeight) {
                    Navigator.pop(context);
                  }
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: _containerHeight,
                  constraints: BoxConstraints(
                    maxHeight: maxSheetHeight,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(13))),
                  child: Storage(
                    friendsUid: widget.friendsUid,
                    uid: widget.uid,
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {
        _isFilePickerActive = false;
      });
    });
  }
  bool arrow_min = false;
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () async {
              final PermissionState ps = await PhotoManager
                  .requestPermissionExtend(); // the method can use optional param `permission`.
              _attachFile();
            },
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: 0.5,
                child: Icon(
                  Icons.attach_file,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onLongPressStart: (details) async {
              setState(() {
                isRecording = true;
                _controller.forward();
              });
              await _startRecording();

            },
            onLongPressEnd: (details) async {
              setState(() {
            
                isRecording = false;
                _controller.reverse();
              });
              await _stopRecording();
            },
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ScaleTransition(
                scale: Tween<double>(begin: 1, end: 1.2).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: 
                Icon(
                  Icons.keyboard_voice,
                  color: isRecording ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
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
                controller: widget.controller,
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
            onTap: () {
              if (widget.controller.text.isNotEmpty) {
                widget.onSendMessage(widget.controller.text);
                widget.controller.text = '';
                
              } else {
                print('empty');
              }
            },
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
