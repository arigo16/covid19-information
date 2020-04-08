import 'package:flutter/material.dart';

import 'package:covid_in/page/utilities/color.dart';

class InformationPage extends StatefulWidget {
  static const String routeName = "/page-information";

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
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
          title: const Text('Informasi'),
          automaticallyImplyLeading: false),
      body: Container(),
    );
  }
}
