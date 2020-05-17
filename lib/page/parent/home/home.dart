import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:covid_in/page/utilities/style.dart';
import 'package:covid_in/page/utilities/color.dart';
import 'package:covid_in/page/utilities/constant.dart';

import 'package:covid_in/page/widget/counter.dart';

import 'package:covid_in/page/parent/information/information_indonesia.dart';
import 'package:covid_in/page/parent/information/information_daily.dart';
import 'package:covid_in/page/parent/information/information_global.dart';
import 'package:covid_in/page/parent/information/information_tangerang.dart';
import 'package:covid_in/page/parent/diagnosis/diagnosis.dart';

import 'package:covid_in/api/home_api.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/page-home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dataIndonesia;
  var isFetchIndonesia = true;

  var dataGlobal;
  var isFetchGlobal = true;

  @override
  void initState() {
    super.initState();

    this.fetchInitDataIndonesia();
    this.fetchInitDataGlobal();
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

  void fetchInitDataGlobal() async {
    this.isFetchGlobal = true;
    ApiServiceHome.getDataGlobal().then((result) async {
      var data = json.decode(result);

      setState(() {
        dataGlobal = data['data'];
        this.isFetchGlobal = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final numFormatter = new NumberFormat("#,###");
    var dateFormat = new DateFormat('dd MMMM');
    var dateTimeFormat = new DateFormat('dd MMMM (H:mm WIB)');
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

    Widget counterDataSpesimen() {
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  numFormatter.format(dataIndonesia['data']['total_spesimen']),
                  style: TextStyle(
                      color: kInfectedColor, fontSize: size.width / 22),
                ),
                Text("Specimen", style: kSubTextStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  numFormatter.format(dataIndonesia['data']['jumlah_odp']),
                  style:
                      TextStyle(color: kDeathColor, fontSize: size.width / 22),
                ),
                Text("PIM", style: kSubTextStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  numFormatter.format(dataIndonesia['data']['jumlah_pdp']),
                  style:
                      TextStyle(color: kCarecolor, fontSize: size.width / 22),
                ),
                Text("PUS", style: kSubTextStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  numFormatter
                      .format(dataIndonesia['data']['total_spesimen_negatif']),
                  style: TextStyle(
                      color: kRecovercolor, fontSize: size.width / 22),
                ),
                Text("Negative", style: kSubTextStyle),
              ],
            )
          ],
        );
      }
    }

    Widget counterDataDailyIndonesia() {
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
              number: dataIndonesia['update']['penambahan']['jumlah_positif'],
              title: "Infected",
            ),
            Counter(
              color: kDeathColor,
              number: dataIndonesia['update']['penambahan']['jumlah_meninggal'],
              title: "Died",
            ),
            Counter(
              color: kCarecolor,
              number: dataIndonesia['update']['penambahan']['jumlah_dirawat'],
              title: "Treated",
            ),
            Counter(
              color: kRecovercolor,
              number: dataIndonesia['update']['penambahan']['jumlah_sembuh'],
              title: "Recovered",
            ),
          ],
        );
      }
    }

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
              title: "Infected",
            ),
            Counter(
              color: kDeathColor,
              number: dataGlobal['Global']['TotalDeaths'],
              title: "Died",
            ),
            Counter(
              color: kRecovercolor,
              number: dataGlobal['Global']['TotalRecovered'],
              title: "Recovered",
            ),
          ],
        );
      }
    }

    Widget dateLastIndonesiaDaily() {
      if (this.isFetchIndonesia == true) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Daily Indonesian Data\n",
                style: kTitleTextstyle,
              ),
              TextSpan(
                text: "processing, please wait a minutes",
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
                text: "Daily Indonesian Data\n",
                style: kTitleTextstyle,
              ),
              TextSpan(
                text: "Adding the latest data on " +
                    dateFormat.format(DateTime.parse(
                        dataIndonesia['update']['penambahan']['tanggal'])),
                style: TextStyle(
                  color: kTextLightColor,
                ),
              ),
            ],
          ),
        );
      }
    }

    Widget dateLastGlobal() {
      if (this.isFetchGlobal == true) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Global Data\n",
                style: kTitleTextstyle,
              ),
              TextSpan(
                text: "processing, please wait a minutes",
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
                text: "Global Data\n",
                style: kTitleTextstyle,
              ),
              TextSpan(
                text: "Last update data on " +
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

    Widget btnDiagnosa() {
      return Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        width: double.infinity,
        height: size.width / 8,
        child: ButtonTheme(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          buttonColor: colorPrimary,
          minWidth: double.infinity,
          height: size.width / 8,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiagnosisPage()),
              );
            },
            child: new Text(
              "Self Diagnosis",
              style: new TextStyle(
                  fontSize: size.width / 20,
                  color: Colors.white,
                  fontFamily: 'ProximaBold'),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // BACKGROUND
                Column(
                  children: <Widget>[
                    Container(
                      width: size.width,
                      height: (size.height / 5.5) +
                          MediaQuery.of(context).padding.top,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        gradient: LinearGradient(
                          colors: [colorPrimary, colorSecond],
                          begin: Alignment(-1.0, -2.0),
                          end: Alignment(1.0, 2.0),
                        ),
                      ),
                    ),
                  ],
                ),

                // TITLE
                Container(
                  margin: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 10 + MediaQuery.of(context).padding.top,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "COVID-19",
                            style: TextStyle(
                              fontSize: size.width / header,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Information about COVID-19",
                            style: TextStyle(
                              fontSize: size.width / subheader,
                              color: Color(0xFFe7e6eb),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/home/icon.png",
                        height:
                            (size.width / header) + (size.width / subheader),
                      ),
                    ],
                  ),
                ),

                // CARD DATA INDONESIA
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(
                    top: ((size.height / 5.5) / 2) +
                        (MediaQuery.of(context).padding.top),
                    left: 10.0,
                    right: 10,
                  ),
                  width: size.width,
                  // height: size.height / 4.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 2.0,
                          color: colorPrimary.withOpacity(.12))
                    ],
                    gradient: LinearGradient(
                      colors: [Color(0xFFebeef5), Colors.white],
                      begin: Alignment(-1.0, -2.0),
                      end: Alignment(1.0, 2.0),
                    ),
                  ),
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
                                    text: "Indonesian Data\n",
                                    style: kTitleTextstyle,
                                  ),
                                  TextSpan(
                                    text: "Total of all Indonesian data",
                                    style: TextStyle(
                                      color: kTextLightColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InformationIndonesiaPage()),
                                );
                              },
                              child: Text(
                                "See details",
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
              ],
            ),

            // ODP ATAU PDP
            Container(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                width: size.width,
                // height: size.height / 4.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 2.0,
                        color: colorPrimary.withOpacity(.12))
                  ],
                  gradient: LinearGradient(
                    colors: [Color(0xFFebeef5), Colors.white],
                    begin: Alignment(-1.0, -2.0),
                    end: Alignment(1.0, 2.0),
                  ),
                ),
                child: counterDataSpesimen(),
              ),
            ),

            // CARD DATA HARIAN INDONESIA
            Container(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                width: size.width,
                // height: size.height / 4.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 2.0,
                        color: colorPrimary.withOpacity(.12))
                  ],
                  gradient: LinearGradient(
                    colors: [Color(0xFFebeef5), Colors.white],
                    begin: Alignment(-1.0, -2.0),
                    end: Alignment(1.0, 2.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: <Widget>[
                          dateLastIndonesiaDaily(),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InformationDailyPage()),
                              );
                            },
                            child: Text(
                              "See details",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    counterDataDailyIndonesia(),
                  ],
                ),
              ),
            ),

            // CARD DATA GLOBAL
            Container(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                width: size.width,
                // height: size.height / 4.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 2.0,
                        color: colorPrimary.withOpacity(.12))
                  ],
                  gradient: LinearGradient(
                    colors: [Color(0xFFebeef5), Colors.white],
                    begin: Alignment(-1.0, -2.0),
                    end: Alignment(1.0, 2.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: <Widget>[
                          dateLastGlobal(),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InformationGlobalPage()),
                              );
                            },
                            child: Text(
                              "See details",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    counterDataGlobal(),
                  ],
                ),
              ),
            ),

            // Data Kota Tangerang
            Container(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                width: size.width,
                // height: size.height / 4.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 2.0,
                        color: colorPrimary.withOpacity(.12))
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
                      width: 50,
                      margin: EdgeInsets.only(right: 20),
                      child:
                          Image.asset("assets/images/home/tangerang_logo.png"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Tangerang City Data", style: kTitleTextstyle),
                        Text(
                          "Available data of the city of Tangerang",
                          style: TextStyle(
                            color: kTextLightColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InformasionTangerangPage()),
                              );
                            },
                            child: Text(
                              "See details",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment(0.0, 0.0),
              child: Text("Prevention Tips", style: kTitleTextstyle),
            ),

            PreventCard(
              text:
                  "Always use a mask when you are going out, just use a cloth mask to help reduce the use of medical masks.",
              image: "assets/images/home/wear_mask.png",
              title: "Always Use a Mask",
            ),
            PreventCard(
              text:
                  "Always wash your hands with soap when you are before or after leaving the house, use bath soap or handsanitizer to eradicate the COVID-19 virus.",
              image: "assets/images/home/wash_hands.png",
              title: "Always Wash Your Hands",
            ),
            SizedBox(height: (size.width / 8) + 20),
          ],
        ),
      ),
      floatingActionButton: btnDiagnosa(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 2.0,
                      color: colorPrimary.withOpacity(.12))
                ],
                gradient: LinearGradient(
                  colors: [Color(0xFFebeef5), Colors.white],
                  begin: Alignment(-1.0, -2.0),
                  end: Alignment(1.0, 2.0),
                ),
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35,
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Text("data"),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
