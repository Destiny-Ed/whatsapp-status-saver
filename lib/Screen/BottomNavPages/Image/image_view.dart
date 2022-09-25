import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageView extends StatefulWidget {
  final String? imagePath;
  const ImageView({Key? key, this.imagePath}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  ///list of buttons
  List<Widget> buttonsList = const [
    Icon(Icons.download, color: Colors.green),
    Icon(
      Icons.print,
      color: Colors.green,
    ),
    Icon(
      Icons.share,
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              fit: BoxFit.cover, image: FileImage(File(widget.imagePath!))),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(buttonsList.length, (index) {
              return FloatingActionButton(
                heroTag: "$index",
                onPressed: () async {
                  switch (index) {
                    case 0:
                      log("download image");
                      ImageGallerySaver.saveFile(widget.imagePath!)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Image Saved")));
                      });
                      break;
                    case 1:
                      log("Print");
                      FlutterNativeApi.printImage(
                          widget.imagePath!, widget.imagePath!.split("/").last);
                      break;
                    case 2:
                      log("Share");
                      FlutterNativeApi.shareImage(widget.imagePath!);
                      break;
                  }
                },
                child: buttonsList[index],
              );
            })),
      ),
    );
  }
}
