// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:aveosoft_tech/shared/rounded_button.dart';
import 'package:aveosoft_tech/shared/rounded_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.chevron_left_outlined)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 58.0,
                ),
                Text(
                  "Signup",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 58.0,
                ),
                RoundedTextField(
                  context,
                  emailController,
                  hintText: 'Please enter your Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                RoundedTextField(
                  context,
                  passwordController,
                  hintText: 'Please enter your Password',
                  obsecureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 18.0,
                ),
                RoundedButton(context, "Signup", () {
                  Get.to(SignUp());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
