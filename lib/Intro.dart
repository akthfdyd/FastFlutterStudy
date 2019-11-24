import 'package:fast_flutter_study/BlogList.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, "/bloglist"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Hell world"),
      ),
    );
  }
}
