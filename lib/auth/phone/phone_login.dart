// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:aveosoft_tech/services/auth.service.dart';
import 'package:aveosoft_tech/shared/overlay_loading.dart';
import 'package:aveosoft_tech/shared/rounded_button.dart';
import 'package:aveosoft_tech/shared/rounded_field.dart';
import 'package:aveosoft_tech/shared/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final _signInKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

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
          child: Padding(
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
                      "What is your phone number?",
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
                      phoneController,
                      hintText: 'Please enter a Phone Number',
                      keyboardType: TextInputType.phone,
                      validator: Validators.validatePhoneNo,
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    RoundedButton(context, "Send OTP", () async {
                      FocusScope.of(context).unfocus();
                      await sendOtp();
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

  sendOtp() async {
    if (_signInKey.currentState!.validate()) {
      OverlayLoading(context);
      try {
        // Sign In up with email and password.
        Future.delayed(Duration(seconds: 2), () async {
          await AuthenticationHelper()
              .getVerificationId(phoneNumber: phoneController.text.trim())
              .then((value) {
            if (!GetUtils.isNull(value)) {
              Get.back();
              Get.snackbar(
                "Something went wrong",
                '$value',
                icon: Icon(Icons.error_outline_sharp, color: Colors.white),
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          });
        });
      } catch (e) {
        Get.back();
      }
    }
  }
}
