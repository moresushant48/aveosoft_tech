// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aveosoft_tech/screens/dashboard/custom_linechart.dart';
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
  final PageController _pageController = PageController();
  List<String> names = ["1day", "1week", "1year", "5years"];
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  onTapped(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 800), curve: Curves.decelerate);
  }

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
                  .then((value) => Get.offAll(() => SplashScreen()));
            },
            icon: Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView.builder(
          controller: _pageController,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          onPageChanged: (value) {
            setState(() {
              currentTabIndex = value;
            });
          },
          itemBuilder: (context, index) {
            currentTabIndex = index;
            return SimpleTimeSeriesChart(names[index]);
          },
          itemCount: names.length,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: currentTabIndex,
        fixedColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: "1 Day",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: "1 Week",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: "1 Year",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: "5 Year",
          ),
        ],
      ),
    );
  }
}
