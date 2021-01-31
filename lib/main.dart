import 'package:day03_ex/themes/app_theme.dart';
import 'package:day03_ex/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isDarkMode = false;

  _handleChangeDarkThem() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            isDarkMode ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness:
            isDarkMode ? Brightness.dark : Brightness.light,
      ),
    );

    return MaterialApp(
      title: 'day03_ex',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(isDarkMode).copyWith(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: HomePage(changeDarkThemeCallBack: _handleChangeDarkThem),
    );
  }
}
