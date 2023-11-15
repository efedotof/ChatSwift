import 'dart:io';

import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


final pathToSaveAudio = 'audio_example_${DateTime.now().millisecondsSinceEpoch}.aac';


class SoundRecorder{
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecorderInitialised = false;
  bool get isRecording => _audioRecorder!.isRecording;

Future _record() async {
  // Get the app's document directory
  Directory appDocDir = await getApplicationDocumentsDirectory();

  // Create the file in the document directory
  File audioFile = File('${appDocDir.path}/audi_example.aac');

  // Start the recorder
  await _audioRecorder!.startRecorder(toFile: audioFile.path);
}
  Future _stop() async{
      if(!_isRecorderInitialised) return;
    await _audioRecorder!.stopRecorder();
  }

  Future toggleRecording() async{
    if(_audioRecorder!.isStopped){
      await _record();
      print('Начало');
    }else{
      await _stop();
      print('Конец');
    }
  }
  Future init()async{
    _audioRecorder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      throw RecordingPermissionException('Microphone permissions none');
    }
    await _audioRecorder!.openAudioSession();
    _isRecorderInitialised = true;
  }
  void dispose(){
    if(!_isRecorderInitialised) return;
    _audioRecorder!.closeAudioSession();
    _audioRecorder = null;
    _isRecorderInitialised = false;
  }


}