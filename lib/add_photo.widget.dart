// import 'package:flutter/material.dart';
// import 'package:image_picker_web/image_picker_web.dart';

import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:html' as html;

import 'package:path/path.dart' as path;
import 'package:mime_type/mime_type.dart';
import 'package:image_picker_web/image_picker_web.dart';

class AddPhotoWidget extends StatefulWidget {
  @override
  _AddPhotoWidgetState createState() => _AddPhotoWidgetState();
}

class _AddPhotoWidgetState extends State<AddPhotoWidget> {
  // dynamic avatar = <Image>[];
  var avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker Example')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () => _onAddPhoto(),
            child: avatar == null
                ? Container(
                    height: 100,
                    margin: EdgeInsets.all(5),
                    color: Colors.grey.shade700,
                    child: Center(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      width: 300,
                      height: 500,
                      child: Image.memory(avatar),
                    ),
                  ),
            //avatar.first
          ),
        ],
      ),
    );
  }

  Future<void> _onAddPhoto() async {
    // final image = await ImagePickerWeb.getImage(outputType: ImageType.widget);
    // print(image);
    //
    // if (image != null) {
    //   setState(() {
    //     avatar.clear();
    //     avatar.add(image);
    //   });
    // }

    var mediaData = await ImagePickerWeb.getImageInfo;
    dynamic mimeType = mime(path.basename(mediaData.fileName));
    dynamic mediaFile =
        html.File(mediaData.data, mediaData.fileName, {'type': mimeType});

    print('imageFile ${mediaData.toString()}');

    if (mediaData != null) {
      setState(() {
        avatar = mediaData.data;
      });
    }
  }
}
