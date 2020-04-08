import 'dart:async';
import 'package:flutter/material.dart';

import 'package:covid_in/page/parent/parent.dart';

import 'package:covid_in/page/utilities/color.dart';

void main() => runApp(SplashScreen());

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FadeIn();
}

class FadeIn extends State<SplashScreen> {
  Timer timer;
  FlutterLogoStyle logoStyle = FlutterLogoStyle.markOnly;

  FadeIn() {
    timer = new Timer(const Duration(seconds: 3), () {
      setState(() {
        logoStyle = FlutterLogoStyle.horizontal;
        onDoneLoading();
      });
    });
  }

  onDoneLoading() async {
    Navigator.pushReplacementNamed(context, ParentPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: colorPrimary,
          child: Stack(
            children: <Widget>[
              Center(
                child: Image.asset(
                  "assets/images/splashscreen/icon.png",
                  width: size.width / 5,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(),
                  Image.asset(
                    "assets/images/splashscreen/background.png",
                    width: size.width / 1,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
