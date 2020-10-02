import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LaunchScreen.dart';
import 'Theme/dark_theme_provider.dart';
import 'Theme/dark_theme_styles.dart';


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
