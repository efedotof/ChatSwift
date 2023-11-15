import 'package:flutter/material.dart';
import 'package:mychats/Model/Friends/AddIvent.dart';
import 'package:mychats/Model/Friends/Friends.dart';
import 'package:mychats/Model/Notification/Notoficat.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class ScannerOutput extends StatefulWidget {
  const ScannerOutput({super.key});

  @override
  State<ScannerOutput> createState() => _ScannerOutputState();
}

class _ScannerOutputState extends State<ScannerOutput> {
  Result? currentResult;
  NotificationHandler staser = NotificationHandler();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QRCodeDartScanView(
          scanInvertedQRCode: true,
          onCapture: (Result result) {
            setState(() {
              currentResult = result;

              String res = currentResult.toString();
              List<String> chs = res.split(',');
              String friendUserId = chs[0];
              print('friendUserIdfriendUserId $friendUserId');
              String Name = chs[1]; 
                         ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Scanned QR Code Data: ${chs[0]} + Name:${chs[1]}'),
            ),
          );
              
              addIvent(friendUserId, Name);
            });
          },
        ),
        Center(
          child: ClipRect(
            child: Container(
              width: 200,
              height: 200, 
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white, 
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0), 
              ),
            ),
          ),
        ),
      ],
    );
  }
}