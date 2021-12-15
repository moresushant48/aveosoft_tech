// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:aveosoft_tech/auth/signup.dart';
import 'package:aveosoft_tech/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Aveosoft Tech",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 68.0,
                ),
                RoundedButton(context, "Email Signup", () {
                  Get.to(() => SignUp());
                }),
                SizedBox(
                  height: 12.0,
                ),
                RoundedButton(context, "Email Login", () {
                  Get.to(() => SignUp());
                }),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                RoundedButton(context, "Phone Login", () {
                  Get.to(() => SignUp());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
