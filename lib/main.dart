import 'package:fast_flutter_study/BlogContent.dart';
import 'package:fast_flutter_study/BlogList.dart';
import 'package:fast_flutter_study/Intro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
//        '/': (context) => Intro(),
        '/': (context) => BlogList(),
        '/blogcontent': (context) => BlogContent(),
      },
    );
  }
}
