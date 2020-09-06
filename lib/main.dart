import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:improve_skill/MyHomePage.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
    runApp(new MaterialApp(
     debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text('Welcome In TechInterview',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
     // image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Tech Interview"),
      loaderColor: Colors.red
    );
  }
}
