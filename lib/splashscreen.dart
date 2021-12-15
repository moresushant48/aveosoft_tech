// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aveosoft_tech/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkForRoutes();
  }

  checkForRoutes() {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => AuthScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 240,
            ),
            SizedBox(
              height: 32.0,
            ),
            Text(
              "Aveosoft Tech",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 6.0,
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            SizedBox(
              width: 200.0,
              child: LinearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
