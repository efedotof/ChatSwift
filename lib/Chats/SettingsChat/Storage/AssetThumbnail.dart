import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mychats/Chats/SettingsChat/Storage/Storage.dart';
import 'package:photo_manager/photo_manager.dart';


class AssetThumbnail extends StatefulWidget {
  const AssetThumbnail({
    Key? key,
    required this.assetId,

  }) : super(key: key);
  final AssetEntity assetId;

  @override
  State<AssetThumbnail> createState() => _AssetThumbnailState();
}

class _AssetThumbnailState extends State<AssetThumbnail> {
  bool isSelecteds = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                isSelecteds = !isSelecteds;
                Storage.of(context)!.handleSelectionChange(widget.assetId, isSelecteds);
              });
            },
            child: Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  height: MediaQuery.of(context).size.height * 0.2,
            child: FutureBuilder<Uint8List?>(
              future: widget.assetId.thumbnailData, 
              builder: (_, snapshot) {
                final bytes = snapshot.data;
                if (bytes == null) return CircularProgressIndicator();
                return Image.memory(bytes, fit: BoxFit.cover);
              },
            ),
                  ),
          ),
         Positioned(
      top: 8.0, 
      right: 8.0,
      child: Container(
        width: 20.0, 
        height: 20.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelecteds ? Colors.green : Colors.transparent,
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        child: isSelecteds
            ? Icon(
                Icons.check,
                color: Colors.white,
                size: 16.0,
              )
            : null,
      ),
    ),
        ],
      ),
    );
  }
}





