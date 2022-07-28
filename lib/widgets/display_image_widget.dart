import 'dart:io';

import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String path;
  const ImageCard({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: FileImage(File(path)))),
        ),
      ),
    );
  }
}
