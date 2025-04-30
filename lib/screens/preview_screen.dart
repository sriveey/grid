import 'package:flutter/material.dart';
import '../widgets/photo_grid.dart';

class PreviewScreen extends StatelessWidget {
  final String username;

  PreviewScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("@$username's Grid")),
      body: PhotoGrid(photos: []), // We'll populate this soon
    );
  }
}
