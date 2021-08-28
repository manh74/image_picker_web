import 'package:flutter/material.dart';

import 'add_photo.widget.dart';

void main() => runApp(MaterialApp(title: 'Demo Thôi Nhó', home: HomePage()));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddPhotoWidget();
  }
}
