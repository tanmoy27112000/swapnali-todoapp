import 'package:flutter/material.dart';
import 'package:todoapp/homepage.dart';

void main() {
  runApp(const MyApp());
}

//stateless --- ui remains same and stateful widget --- can change the ui
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}
