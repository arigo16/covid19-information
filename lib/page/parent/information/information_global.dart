import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:covid_in/page/utilities/color.dart';
import 'package:covid_in/page/utilities/constant.dart';

import 'package:covid_in/page/widget/counter.dart';

import 'package:covid_in/api/home_api.dart';

class InformationGlobalPage extends StatefulWidget {
  static const String routeName = "/page-information-global";

  @override
  _InformationGlobalPageState createState() => _InformationGlobalPageState();
}

class _InformationGlobalPageState extends State<InformationGlobalPage> {
  var dataGlobal;
  var isFetchGlobal = true;

  @override
  void initState() {
    super.initState();

    this.fetchInitDataGlobal();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchInitDataGlobal() async {
    this.isFetchGlobal = true;
    ApiServiceHome.getDataGlobal().then((result) async {
      var data = json.decode(result);

      setState(() {
        dataGlobal = data['data'];
        this.isFetchGlobal = false;
      });

      print(dataGlobal);
    });
  }

  @override
  Widget build(BuildContext context) {
    final numFormatter = new NumberFormat("#,###");
    var dateTimeFormat = new DateFormat('dd MMMM (H:mm WIB)');
    var size = MediaQuery.of(context).size;

    Widget counterDataGlobal() {
      if (this.isFetchGlobal == true) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              "assets/images/home/loading.gif",
              height: 50,
            ),
            Image.asset(
              "assets/images/home/loading.gif",
              height: 50,
            ),
            Image.asset(
              "assets/images/home/loading.gif",
              height: 50,
            ),
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Counter(
              color: kInfectedColor,
              number: dataGlobal['Global']['TotalConfirmed'],
              title: "Positif",
            ),
            Counter(
              color: kDeathColor,
              number: dataGlobal['Global']['TotalDeaths'],
              title: "Meninggal",
            ),
            Counter(
              color: kRecovercolor,
              number: dataGlobal['Global']['TotalRecovered'],
              title: "Sembuh",
            ),
          ],
        );
      }
    }

    Widget dateLastGlobal() {
      if (this.isFetchGlobal == true) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Data Global\n",
                style: kTitleTextstyle,
              ),
              TextSpan(
                text: "Sedang memuat data mohon tunggu",
                style: TextStyle(
                  color: kTextLightColor,
                ),
              ),
            ],
          ),
        );
      } else {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Data Global\n",
                style: kTitleTextstyle,
              ),
              TextSpan(
                text: "Update pada " +
                    dateTimeFormat.format(DateTime.parse(dataGlobal['Date'])),
                style: TextStyle(
                  color: kTextLightColor,
                ),
              ),
            ],
          ),
        );
      }
    }

    Widget cardGlobal(country, positif, sembuh, meninggal) {
      return Container(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 2.0,
                color: colorPrimary.withOpacity(.12),
              )
            ],
            gradient: LinearGradient(
              colors: [Color(0xFFebeef5), Colors.white],
              begin: Alignment(-1.0, -2.0),
              end: Alignment(1.0, 2.0),
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 40,
                margin: EdgeInsets.only(right: 20),
                child: Image.asset("assets/images/information/global.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(country,
                      overflow: TextOverflow.ellipsis, style: kTitleTextstyle),
                  Text(
                    "Sembuh " +
                        (numFormatter.format(sembuh)).toString() +
                        " dan Meninggal " +
                        (numFormatter.format(meninggal)).toString(),
                    style: TextStyle(
                      color: kInfectedColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      "Total Positif " +
                          (numFormatter.format(positif)).toString(),
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget listingCardGlobal(List<dynamic> dataGlobal) {
      if (this.isFetchGlobal == false) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return cardGlobal(
                dataGlobal[index]['Country'],
                dataGlobal[index]['TotalConfirmed'],
                dataGlobal[index]['TotalRecovered'],
                dataGlobal[index]['TotalDeaths']);
          },
          itemCount: dataGlobal.length,
        );
      } else {
        return Container(
            child: Image.asset("assets/images/information/loading.gif"));
      }
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height / 6,
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
                  height: size.height - (size.height / 4) - 56)
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height / 20,
              ),
              Container(
                width: size.width,
                height: size.height - (size.height / 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      margin: EdgeInsets.only(bottom: 10),
                      width: size.width,
                      height: size.height / 5,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: <Widget>[
                                  dateLastGlobal(),
                                  Spacer(),
                                ],
                              ),
                            ),
                            counterDataGlobal(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.height -
                          (size.height / 20) -
                          (size.height / 5) -
                          10,
                      child: this.isFetchGlobal == false
                          ? listingCardGlobal(dataGlobal['Countries'])
                          : listingCardGlobal(dataGlobal),
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
