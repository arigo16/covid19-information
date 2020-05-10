import 'package:covid_in/page/parent/home/home.dart';
import 'package:flutter/material.dart';

import 'package:covid_in/page/splash/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    HomePage.routeName: (context) => HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Covid 19 Information',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: routes);
  }
}
