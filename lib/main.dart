import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/home_screen.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename:(context) => HomeScreen()
      },
      initialRoute:HomeScreen.routename ,
      theme: Apptheme.ligthTheme,
      darkTheme: Apptheme.darktheme,
      themeMode: ThemeMode.light,
    );
  }
}