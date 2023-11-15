import 'package:flutter/material.dart';
import 'package:mychats/Chats/SettingsChat/Storage/AssetThumbnail.dart';
import 'package:photo_manager/photo_manager.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key,
  });

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<AssetEntity> assets = [];
  final controller = ScrollController();
  int loadedAssetsCount = 0;
  int batchSize = 3;
  bool isSelected = false;

  @override
  void initState() {
    _fetchAssets();
    super.initState();
  }

  _fetchAssets() async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final recentAlbum = albums.first;
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0,
      end: 40000,
    );
    setState(() => assets = recentAssets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          controller: controller,
          child: Wrap(
            children: List.generate(
              assets.length,
              (index) {
                return AssetThumbnail(
                  assetId: assets[index],
              
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}