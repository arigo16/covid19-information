import 'package:flutter/material.dart';

import 'package:covid_in/page/utilities/color.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/page-home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorPrimary,
          title: const Text('Beranda'),
          automaticallyImplyLeading: false),
      body: Container(),
    );
  }
}
