import 'package:flutter/material.dart';
import 'breeds_page.dart';
import 'models/palette.dart';


void main() {
  runApp(const CatApp());
}

class CatApp extends StatelessWidget {
  const CatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat App',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xFF4D726E)),
      ),
      initialRoute: '/breeds',
      routes: {
        '/breeds': (context) => const BreedsPage(),
      },
    );
  }

}