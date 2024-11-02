import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/tabs/tasks/tasks_provider.dart';

Future <void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider( create: (_)=>TasksProvider()  ,child: ( (TodoApp()))));
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