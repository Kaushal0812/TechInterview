import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:improve_skill/MyHomePage.dart';
import 'package:improve_skill/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'dark_theme_preference.dart';
import 'dark_theme_provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
 DarkThemeProvider themeProvider = new DarkThemeProvider();
  @override
  void initState() {
    super.initState();
    currentTheme();
  }
  void currentTheme() async {
    themeProvider.darkTheme = await themeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider<DarkThemeProvider>(
           create: (_) {
          return themeProvider;
        },
         child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeProvider.darkTheme, context),
              home: new LaunchScreen(),
              // routes: <String, WidgetBuilder>{
              //   AGENDA: (BuildContext context) => AgendaScreen(),
              //},
            );
          },
        ),
        );
  }
}

class LaunchScreen extends StatefulWidget {
  @override
  LaunchScreenState createState() => LaunchScreenState();
}
class LaunchScreenState extends State<LaunchScreen> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
     // image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Tech Interview"),
      loaderColor: Colors.red,
    );
  }
}