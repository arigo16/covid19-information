import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:covid_in/page/utilities/color.dart';
import 'package:covid_in/page/utilities/constant.dart';

import 'package:covid_in/api/home_api.dart';

class InformasionTangerangPage extends StatefulWidget {
  static const String routeName = "/page-information-tangerang";

  @override
  _InformasionTangerangPageState createState() =>
      _InformasionTangerangPageState();
}

class _InformasionTangerangPageState extends State<InformasionTangerangPage> {
  var dataTangerang;
  var isFetchTangerang = true;

  @override
  void initState() {
    super.initState();

    this.fetchInitDataTangerang();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchInitDataTangerang() async {
    this.isFetchTangerang = true;
    ApiServiceHome.getListingTangerang().then((result) async {
      var data = json.decode(result);

      setState(() {
        dataTangerang = data['data'];
        this.isFetchTangerang = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final numFormatter = new NumberFormat("#,###");
    var size = MediaQuery.of(context).size;

    Widget cardTangerang(kelurahan, positif, sembuh, meninggal, aktif) {
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
                width: 50,
                margin: EdgeInsets.only(right: 20),
                child: Image.asset("assets/images/home/tangerang_logo.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(kelurahan,
                      overflow: TextOverflow.ellipsis, style: kTitleTextstyle),
                  Text(
                    "Recovered " +
                        (numFormatter.format(sembuh)).toString() +
                        " and Infected " +
                        (numFormatter.format(aktif)).toString(),
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
                      "Total Cases " +
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

    Widget listingCardTangerang(List<dynamic> dataTangerang) {
      if (this.isFetchTangerang == false) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return cardTangerang(
                dataTangerang[index]['properties']['kelurahan'],
                dataTangerang[index]['properties']['positif_total'],
                dataTangerang[index]['properties']['sembuh'],
                dataTangerang[index]['properties']['meninggal'],
                dataTangerang[index]['properties']['aktif']);
          },
          itemCount: dataTangerang.length,
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: size.width / 2,
                  child: Image.asset("assets/images/information/loading.gif"),
                )
              ],
            )
          ],
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: this.isFetchTangerang == false
          ? listingCardTangerang(dataTangerang['features'])
          : listingCardTangerang(dataTangerang),
    );
  }
}
