import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Theme/dark_theme_provider.dart';


Widget switchBlock(BuildContext context) { {
  final themeChange = Provider.of<DarkThemeProvider>(context);
  return CheckboxListTile(
      title: const Text('Change Theme'),
      value: themeChange.darkTheme,
      onChanged: (bool value) {
        themeChange.darkTheme = value;
      },
    );
}
}
