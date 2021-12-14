// ignore_for_file: prefer_const_constructors

import 'package:aveosoft_tech/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aveosoft',
      themeMode: ThemeMode.dark,
      theme:
          ThemeData(primarySwatch: Colors.green, brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
