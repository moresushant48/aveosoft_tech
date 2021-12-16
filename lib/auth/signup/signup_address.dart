// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:aveosoft_tech/auth/signup/signup_contact.dart';
import 'package:aveosoft_tech/controllers/user.controller.dart';
import 'package:aveosoft_tech/shared/rounded_button.dart';
import 'package:aveosoft_tech/shared/rounded_field.dart';
import 'package:aveosoft_tech/shared/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpAddress extends StatefulWidget {
  const SignUpAddress({Key? key}) : super(key: key);

  @override
  _SignUpAddressState createState() => _SignUpAddressState();
}

class _SignUpAddressState extends State<SignUpAddress> {
  final _signUpAddressKey = GlobalKey<FormState>();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _signUpAddressKey,
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
                            "What is your Address?",
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
                      streetController,
                      hintText: 'Please enter Street',
                      keyboardType: TextInputType.streetAddress,
                      validator: Validators.validateStreet,
                    ),
                    RoundedTextField(
                      context,
                      cityController,
                      hintText: 'Please enter City',
                      keyboardType: TextInputType.name,
                      validator: Validators.validateName,
                    ),
                    RoundedTextField(
                      context,
                      pincodeController,
                      hintText: 'Please enter Pincode',
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      validator: Validators.validatePincode,
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    RoundedButton(context, "Continue", () {
                      FocusScope.of(context).unfocus();
                      saveAddress();
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

  saveAddress() {
    if (_signUpAddressKey.currentState!.validate()) {
      try {
        final controller = Get.put(UserController());
        controller.userModel.value.street = streetController.text.trim();
        controller.userModel.value.city = cityController.text.trim();
        controller.userModel.value.pincode = pincodeController.text.trim();
        Get.to(() => SignUpContact());
      } catch (e) {
        e.printError();
      }
    }
  }
}
