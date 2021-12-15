// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aveosoft_tech/services/auth.service.dart';
import 'package:aveosoft_tech/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charts'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await AuthenticationHelper()
                  .signOut()
                  .then((value) => Get.offAll(SplashScreen()));
            },
            icon: Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: constraints,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                color: Colors.red,
                child: Column(
                  children: [
                    Text("This is charts page."),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
