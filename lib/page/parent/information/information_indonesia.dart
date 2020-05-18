import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:covid_in/page/utilities/color.dart';
import 'package:covid_in/page/utilities/constant.dart';

import 'package:covid_in/page/widget/counter.dart';

import 'package:covid_in/api/home_api.dart';

class InformationIndonesiaPage extends StatefulWidget {
  static const String routeName = "/page-information-indonesia";

  @override
  _InformationIndonesiaPageState createState() =>
      _InformationIndonesiaPageState();
}

class _InformationIndonesiaPageState extends State<InformationIndonesiaPage> {
  var dataIndonesia;
  var isFetchIndonesia = true;

  var dateListProv;
  var dataListProv;
  var isFetchList = true;

  @override
  void initState() {
    super.initState();

    this.fetchInitDataIndonesia();
    this.fetchInitDataProv();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchInitDataIndonesia() async {
    this.isFetchIndonesia = true;
    ApiServiceHome.getDataIndonesia().then((result) async {
      var data = json.decode(result);

      setState(() {
        dataIndonesia = data['data'];
        this.isFetchIndonesia = false;
      });
    });
  }

  void fetchInitDataProv() async {
    this.isFetchList = true;
    ApiServiceHome.getListingAllProv().then((result) async {
      var data = json.decode(result);

      setState(() {
        dateListProv = data['data']['last_date'];
        dataListProv = data['data']['list_data'];
        this.isFetchList = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final numFormatter = new NumberFormat("#,###");
    var size = MediaQuery.of(context).size;

    Widget counterDataIndonesia() {
      if (this.isFetchIndonesia == true) {
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
              number: dataIndonesia['update']['total']['jumlah_positif'],
              title: "Infected",
            ),
            Counter(
              color: kDeathColor,
              number: dataIndonesia['update']['total']['jumlah_meninggal'],
              title: "Died",
            ),
            Counter(
              color: kCarecolor,
              number: dataIndonesia['update']['total']['jumlah_dirawat'],
              title: "Treated",
            ),
            Counter(
              color: kRecovercolor,
              number: dataIndonesia['update']['total']['jumlah_sembuh'],
              title: "Recovered",
            ),
          ],
        );
      }
    }

    Widget cardProv(city, total, sembuh, meninggal, dirawat) {
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
                child: Image.asset("assets/images/information/navigation.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(city,
                      overflow: TextOverflow.ellipsis, style: kTitleTextstyle),
                  Text(
                    "Recovered " +
                        (numFormatter.format(sembuh)).toString() +
                        " and Treated " +
                        (numFormatter.format(dirawat)).toString(),
                    style: TextStyle(
                      color: kInfectedColor,
                    ),
                  ),
                  Text(
                    "Died " + (numFormatter.format(meninggal)).toString(),
                    style: TextStyle(
                      color: kInfectedColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      "Total Cases " + (numFormatter.format(total)).toString(),
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

    Widget listingCardProv(List<dynamic> dataListProv) {
      if (this.isFetchList == false) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return cardProv(
                dataListProv[index]['key'],
                dataListProv[index]['jumlah_kasus'],
                dataListProv[index]['jumlah_sembuh'],
                dataListProv[index]['jumlah_meninggal'],
                dataListProv[index]['jumlah_dirawat']);
          },
          itemCount: dataListProv.length,
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
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Data Accumulation\n",
                                          style: kTitleTextstyle,
                                        ),
                                        TextSpan(
                                          text: "Total of Data Accumulation",
                                          style: TextStyle(
                                            color: kTextLightColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      this.isFetchList == true
                                          ? "Loading"
                                          : dateListProv,
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            counterDataIndonesia(),
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
                      child: listingCardProv(dataListProv),
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
