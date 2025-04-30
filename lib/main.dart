import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(InstagramGridPreviewApp());
}

class InstagramGridPreviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Grid Preview',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
