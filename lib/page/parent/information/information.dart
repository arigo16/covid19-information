import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:covid_in/page/utilities/color.dart';

import 'package:covid_in/api/home_api.dart';

class InformationPage extends StatefulWidget {
  static const String routeName = "/page-information";

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  var dataListCountry = [];

  @override
  void initState() {
    super.initState();

    this.fetchInitUpdate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchInitUpdate() async {
    ApiServiceHome.getListingAllCountry().then((result) async {
      var data = json.decode(result);

      setState(() {
        dataListCountry = data['data'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget cardCountry(country, total) {
      return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              leading: Icon(Icons.album, size: 50),
              title: Text(country),
              subtitle: Text(total.toString() + " Terkonfirmasi"),
            ),
          ],
        ),
      );
    }

    Widget listingCardCountry(List<dynamic> dataListCountry) {
      if (dataListCountry.length > 0) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return cardCountry(
                dataListCountry[index]['attributes']['Country_Region'],
                dataListCountry[index]['attributes']['Confirmed']);
          },
          itemCount: dataListCountry.length,
        );
      } else {
        return Text("Loading");
      }
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height / 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colorPrimary, colorSecond],
                    begin: Alignment(-1.0, -2.0),
                    end: Alignment(1.0, 2.0),
                  ),
                ),
              ),
              Container(
                  width: size.width,
                  height: size.height - (size.height / 3) - 56)
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height / 6,
              ),
              Container(
                width: size.width,
                height: size.height - (size.height / 6) - 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: size.width,
                      height: size.height / 3.5,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        elevation: 10.0,
                        child: Text(
                          "",
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.height -
                          (size.height / 6) -
                          56 -
                          (size.height / 3.5),
                      child: listingCardCountry(dataListCountry),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
