import 'package:flutter/material.dart';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'home/home.dart';
import 'information/information.dart';

import 'package:covid_in/page/utilities/color.dart';

class ParentPage extends StatefulWidget {
  static const String routeName = "/page-parent";

  @override
  _ParentPageState createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
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
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomePage(),
            InformationPage(),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Beranda'),
              icon: Icon(Icons.home),
              activeColor: colorPrimary),
          BottomNavyBarItem(
              title: Text('Informasi'),
              icon: Icon(Icons.info),
              activeColor: colorPrimary),
          BottomNavyBarItem(
              title: Text('Berita'),
              icon: Icon(Icons.book),
              activeColor: colorPrimary),
          BottomNavyBarItem(
              title: Text('Pengaturan'),
              icon: Icon(Icons.settings),
              activeColor: colorPrimary),
        ],
      ),
    );
  }
}
