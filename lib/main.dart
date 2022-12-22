import 'package:alura/data/taks_inherited.dart';
import 'package:alura/screens/formScreen.dart';
import 'package:alura/screens/initialScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,

      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}




