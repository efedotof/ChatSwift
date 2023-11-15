import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_sound_lite/public/flutter_sound_player.dart';

import 'SettingsChat/Storage/ViewImage.dart';

class MessageCards extends StatefulWidget {
  const MessageCards({
    super.key,
    required this.text,
    required this.isMyMessage,
    required this.isImage,
    required this.isAudio,
  });
  final String text;
  final bool isMyMessage;
  final bool isImage;
  final bool isAudio;

  @override
  State<MessageCards> createState() => _MessageCardsState();
}

class _MessageCardsState extends State<MessageCards> {
  FlutterSoundPlayer? _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = FlutterSoundPlayer();
  }

@override
void dispose() {
  _audioPlayer?.closeAudioSession();
  super.dispose();
}
Future<void> _playAudio(String audioUrl) async {
  if (_audioPlayer != null) {
    await _audioPlayer!.openAudioSession();
    await _audioPlayer!.startPlayer(
      fromURI: audioUrl,
      whenFinished: () {
        setState(() {
          _isPlaying = false;
        });
      },
    );
    setState(() {
      _isPlaying = true;
    });
  }
}
  Future toggle()async{
    if(!_isPlaying){
        await _playAudio(widget.text);
    }else{
      await _stopAudio();
    }
  }



  Future<void> _stopAudio() async {
  if (_audioPlayer != null) {
    _audioPlayer!.closeAudioSession();
    _audioPlayer = null;
    await _audioPlayer!.stopPlayer();
  }
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ChatBubble(
        clipper: widget.isMyMessage
            ? ChatBubbleClipper1(type: BubbleType.sendBubble)
            : ChatBubbleClipper1(type: BubbleType.receiverBubble),
        alignment: widget.isMyMessage ? Alignment.topRight : Alignment.topLeft,
        margin: const EdgeInsets.only(top: 10),
        backGroundColor: widget.isMyMessage ? Colors.blue : Colors.green,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: widget.isAudio
                ? Row(
                    children: [
                      GestureDetector(onTap: (){toggle();},child: Icon(_isPlaying?Icons.stop:Icons.play_arrow, color: Colors.white)),
                      SizedBox(width: 8), // Adjust the spacing as needed
                      Expanded(
                        child: Container(
                          height: 8, // Adjust the height of the track
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  )
                : (widget.isImage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ViewImages(text: widget.text),
                            ),
                          );
                        },
                        child: Image.network(
                          "${widget.text}.jpg",
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.5,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print("Error loading image: $error");
                            return Text("Error loading image");
                          },
                        ),
                      )
                    : Text(
                        widget.text,
                        style: const TextStyle(color: Colors.white),
                      )),
          ),
        ),
      ),
    );
  }
}
