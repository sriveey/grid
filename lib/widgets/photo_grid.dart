import 'package:flutter/material.dart';
import '../models/photo.dart';
import 'dart:io';

class PhotoGrid extends StatelessWidget {
  final List<Photo> photos;

  PhotoGrid({required this.photos});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 4 / 5,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return Container(
          color: Colors.grey[300],
          child: photo.source == PhotoSource.instagram
              ? Image.network(photo.path, fit: BoxFit.cover)
              : Image.file(File(photo.path), fit: BoxFit.cover),
        );
      },
    );
  }
}
