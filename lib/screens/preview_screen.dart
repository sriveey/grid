import 'package:flutter/material.dart';
import '../widgets/photo_grid.dart';
import '../models/photo.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class PreviewScreen extends StatefulWidget {
  final String username;
  PreviewScreen({required this.username});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  List<Photo> photos = [];

  @override
  void initState() {
    super.initState();
    loadMockPhotos();
  }

  void loadMockPhotos() {
    photos = List.generate(
      9,
      (index) => Photo(
        id: '$index',
        path: 'https://picsum.photos/id/${index + 10}/400/500',
        source: PhotoSource.instagram,
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        photos.add(
          Photo.fromGallery(pickedFile.path),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("@${widget.username}'s Grid")),
      body: PhotoGrid(photos: photos),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        child: const Icon(Icons.add_photo_alternate),
      ),
    );
  }
}

