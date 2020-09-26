import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'MyHomePage.dart';

class LaunchScreen extends StatefulWidget {
  @override
  LaunchScreenState createState() => LaunchScreenState();
}
class LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text('Mobililty Interview Questions',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Tech Interview"),
      loaderColor: Colors.red,
    );
  }
}
