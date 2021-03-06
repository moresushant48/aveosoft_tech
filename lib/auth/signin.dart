// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:aveosoft_tech/screens/dashboard/homepage.dart';
import 'package:aveosoft_tech/services/auth.service.dart';
import 'package:aveosoft_tech/shared/overlay_loading.dart';
import 'package:aveosoft_tech/shared/rounded_button.dart';
import 'package:aveosoft_tech/shared/rounded_field.dart';
import 'package:aveosoft_tech/shared/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _signInKey = GlobalKey<FormState>();
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
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _signInKey,
              child: SizedBox(
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
                      "Login",
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
                      validator: Validators.validateEmail,
                    ),
                    RoundedTextField(
                      context,
                      passwordController,
                      hintText: 'Please enter your Password',
                      obsecureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: Validators.validatePassword,
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    RoundedButton(context, "Login", () {
                      FocusScope.of(context).unfocus();
                      signIn();
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signIn() {
    if (_signInKey.currentState!.validate()) {
      OverlayLoading(context);
      Future.delayed(Duration(seconds: 2), () async {
        try {
          // Sign In up with email and password.

          dynamic result = await AuthenticationHelper().signIn(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
          if (GetUtils.isNull(result)) {
            Get.back();
            Get.offAll(HomePage());
            Get.snackbar(
              "Success",
              "Welcome back..!",
              icon: Icon(Icons.check, color: Colors.white),
              snackPosition: SnackPosition.BOTTOM,
            );
          } else {
            Get.back();
            Get.snackbar(
              "Something went wrong",
              "$result",
              icon: Icon(Icons.error_outline_sharp, color: Colors.white),
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        } catch (e) {
          Get.back();
        }
      });
    }
  }
}
