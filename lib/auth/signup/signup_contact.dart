// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:aveosoft_tech/controllers/user.controller.dart';
import 'package:aveosoft_tech/screens/dashboard/homepage.dart';
import 'package:aveosoft_tech/model/user.model.dart';
import 'package:aveosoft_tech/services/auth.service.dart';
import 'package:aveosoft_tech/services/dbstore.service.dart';
import 'package:aveosoft_tech/shared/rounded_button.dart';
import 'package:aveosoft_tech/shared/rounded_field.dart';
import 'package:aveosoft_tech/shared/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpContact extends StatefulWidget {
  const SignUpContact({Key? key}) : super(key: key);

  @override
  _SignUpContactState createState() => _SignUpContactState();
}

class _SignUpContactState extends State<SignUpContact> {
  final _signUpContactKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final controller = Get.put(UserController());

  @override
  void initState() {
    super.initState();
  }

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
          child: Form(
            key: _signUpContactKey,
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
                          "What is your Contact?",
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
                    emailController,
                    enabled: false,
                    initialValue: controller.userModel.value.email,
                    hintText: 'Please enter an Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
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
                  RoundedButton(context, "Submit", () {
                    FocusScope.of(context).unfocus();
                    saveContact();
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  saveContact() {
    if (_signUpContactKey.currentState!.validate()) {
      try {
        controller.userModel.value.email = emailController.text.trim();
        controller.userModel.value.phone = phoneController.text.trim();
        //
        DbStore.userId = AuthenticationHelper().user!.uid;

        UserModel userData = UserModel();
        userData = controller.userModel.value;
        userData.uid = DbStore.userId!;

        DbStore.writeUserData(userData);

        //
        Get.offAll(() => HomePage());
      } catch (e) {
        e.printError();
      }
    }
  }
}
