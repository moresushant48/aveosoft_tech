// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:aveosoft_tech/screens/dashboard/homepage.dart';
import 'package:aveosoft_tech/services/auth.service.dart';
import 'package:aveosoft_tech/shared/overlay_loading.dart';
import 'package:aveosoft_tech/shared/rounded_button.dart';
import 'package:aveosoft_tech/shared/rounded_field.dart';
import 'package:aveosoft_tech/shared/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _signInKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

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
                      otpController,
                      hintText: 'Please enter OTP',
                      keyboardType: TextInputType.number,
                      validator: Validators.validatePincode,
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    RoundedButton(context, "Verify", () async {
                      FocusScope.of(context).unfocus();
                      await verifyOtp();
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

  verifyOtp() async {
    var vid = Get.arguments[0];
    if (_signInKey.currentState!.validate()) {
      OverlayLoading(context);
      Future.delayed(Duration(seconds: 2), () async {
        try {
          // Sign In up with email and password.
          PhoneAuthCredential phoneAuthCredential =
              PhoneAuthProvider.credential(
                  verificationId: vid, smsCode: otpController.text.trim());

          dynamic result = await AuthenticationHelper()
              .signInWithCredentials(phoneAuthCredential);
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
          e.printError();
          Get.back();
        }
      });
    }
  }
}
