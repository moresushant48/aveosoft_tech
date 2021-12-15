// ignore_for_file: prefer_const_constructors

import 'package:aveosoft_tech/auth/phone/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get user => _auth.currentUser;

  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future getVerificationId({required String phoneNumber}) async {
    try {
      await _auth
          .verifyPhoneNumber(
              phoneNumber: phoneNumber,
              verificationCompleted: (PhoneAuthCredential credentials) async {
                //
              },
              verificationFailed: (FirebaseAuthException e) {
                Get.back();
                Get.snackbar(
                  "Something went wrong",
                  '$e',
                  icon: Icon(Icons.error_outline_sharp, color: Colors.white),
                  snackPosition: SnackPosition.BOTTOM,
                );
                throw e;
              },
              codeSent: (String verificationId, int? resendToken) {
                Get.to(() => OtpScreen(), arguments: [verificationId]);
              },
              timeout: const Duration(seconds: 60),
              codeAutoRetrievalTimeout: (String verificationId) {})
          .then((value) {
        return null;
      });
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signInWithCredentials(AuthCredential credentials) async {
    try {
      await _auth.signInWithCredential(credentials);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
