import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/BottomTask.dart';
import 'package:todo/HomeScreen.dart';
import 'package:todo/ListProvider.dart';
import 'package:todo/SettingsTab.dart';
import 'package:todo/ShowAddBottomSheet.dart';
import 'package:todo/TaskListTab.dart';
import 'package:todo/Theme_Data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: ((context) => ListProvider()),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
             HomeScreen.routeName : (context) => HomeScreen(),
            SettingsTab.routeName : (context) => SettingsTab(),
            TaskListTab.routeName : (context) => TaskListTab(),
            ShowAddTaskBottom.routeName : (context) => ShowAddTaskBottom(),
             BottomTask.routeName : (context) => BottomTask(),

      },
      theme: MyTheme.LightTheme,
      home: HomeScreen(),
    );
  }
}
