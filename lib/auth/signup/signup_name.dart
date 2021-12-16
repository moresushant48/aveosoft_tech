// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:aveosoft_tech/auth/signup/signup_address.dart';
import 'package:aveosoft_tech/controllers/user.controller.dart';
import 'package:aveosoft_tech/services/auth.service.dart';
import 'package:aveosoft_tech/shared/rounded_button.dart';
import 'package:aveosoft_tech/shared/rounded_field.dart';
import 'package:aveosoft_tech/shared/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpName extends StatefulWidget {
  const SignUpName({Key? key}) : super(key: key);

  @override
  _SignUpNameState createState() => _SignUpNameState();
}

class _SignUpNameState extends State<SignUpName> {
  final _signUpNameKey = GlobalKey<FormState>();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                await AuthenticationHelper().signOut();
              },
              icon: Icon(Icons.logout_outlined)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _signUpNameKey,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "What is your Name?",
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 58.0,
                    ),
                    RoundedTextField(
                      context,
                      fNameController,
                      hintText: 'Please enter First Name',
                      keyboardType: TextInputType.name,
                      validator: Validators.validateName,
                    ),
                    RoundedTextField(
                      context,
                      lNameController,
                      hintText: 'Please enter Last Name',
                      keyboardType: TextInputType.name,
                      validator: Validators.validateName,
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    RoundedButton(context, "Continue", () {
                      FocusScope.of(context).unfocus();
                      saveName();
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

  saveName() {
    if (_signUpNameKey.currentState!.validate()) {
      try {
        final controller = Get.put(UserController());
        controller.userModel.value.fName = fNameController.text.trim();
        controller.userModel.value.lName = lNameController.text.trim();
        Get.to(() => SignUpAddress());
      } catch (e) {
        e.printError();
      }
    }
  }
}
