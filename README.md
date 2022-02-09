import 'package:flutter/material.dart';
import 'breeds_page.dart';


void main() {                 //Ausführen der Datei
  runApp(const CatApp());
}

class CatApp extends StatelessWidget {
  const CatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/breeds', // Routs = Seiten / Seitennavigation
      routes: {
        '/breeds': (context) => const BreedsPage(),
    },
    );
  }

}