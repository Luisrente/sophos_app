import 'package:flutter/material.dart';

class AppTheme {

  ThemeData getTheme(){
  const seedColor = Colors.purpleAccent;
  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.white,
    listTileTheme: const ListTileThemeData(
      iconColor: seedColor
    )
  );
  }


}