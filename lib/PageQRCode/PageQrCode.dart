
import 'package:flutter/material.dart';
import 'package:mychats/Scanner/ScannerInput.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';


class PageQrCode extends StatefulWidget {
  const PageQrCode({super.key});

  @override
  State<PageQrCode> createState() => _PageQrCodeState();
}

class _PageQrCodeState extends State<PageQrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons
              .chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('TitleOnScanntoScannerQr',
            style: Theme.of(context).primaryTextTheme.bodyText1),
      ),
      body: ScannerInput()
      
    );
  }
}
