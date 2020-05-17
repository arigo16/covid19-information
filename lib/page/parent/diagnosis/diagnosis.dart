import 'package:flutter/material.dart';

import 'package:covid_in/page/utilities/color.dart';
import 'package:covid_in/page/utilities/style.dart';

class DiagnosisPage extends StatefulWidget {
  static const String routeName = "/page-diagnosis";

  @override
  _DiagnosisPageState createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  var dataG01 = "";
  var dataG02 = "";
  var dataG03 = "";
  var dataG04 = "";

  var isReady = false;

  var isResult = false;

  var title = "";
  var image = "";
  var desc = "";

  var descNormal =
      "You have no symptoms of any serious disorder. Likewise there are no conditions that cause you to be monitored for their health development due to the COVID-19 outbreak.";
  var descDemam =
      "You have symptoms of fever but there is no sign that you are exposed to the COVID-19 virus. Keep yourself isolated until healed and do social distancing.";
  var descOTG =
      "You (Person Without Symptoms) do not have symptoms that occur in the COVID-19 outbreak. However, you have a history of regional visits exposed to the COVID-19 virus. Isolate yourself and do social distancing for at least 14 days.";
  var descODP =
      "You (Person In Monitoring) do not have symptoms that occur in the COVID-19 outbreak. But you have a history of direct contact with suspect COVID-19 virus, isolate yourself immediately and visit the nearest COVID-19 Referral Hospital.";
  var descPDP =
      "You (Patient Under Supervision) have several symptoms that are similar to the outbreak of COVID-19. you are most likely to be exposed to the COVID-19 virus and immediately isolate yourself and visit the nearest COVID-19 Referral Hospital.";
  var descSuspect =
      "You are suspected of having all the similar symptoms that occurred in the COVID-19 outbreak. you are most likely to be exposed to the COVID-19 virus and immediately isolate yourself and visit the nearest COVID-19 Referral Hospital.";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    void checkDataReady() {
      if (this.dataG01 != "" && this.dataG02 != "" && this.dataG03 != "") {
        if (this.dataG03 == "Y") {
          if (this.dataG04 != "") {
            setState(() {
              this.isReady = true;
            });
          } else {
            setState(() {
              this.isReady = false;
            });
          }
        } else {
          setState(() {
            this.isReady = true;
          });
        }
      } else {
        setState(() {
          this.isReady = false;
        });
      }
    }

    Widget cardG04() {
      if (this.dataG03 == 'Y') {
        return Column(
          children: <Widget>[
            Container(
              child: Container(
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
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Do you experience severe respiratory distress ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.width / 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              this.dataG04 = "Y";
                            });

                            checkDataReady();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: (size.width / 2) - 10,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.1,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                              ),
                              color: this.dataG04 == 'Y'
                                  ? colorSecond
                                  : Color(0xFFdfdfdf),
                            ),
                            child: Text(
                              "Yes",
                              style: TextStyle(fontSize: size.width / 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              this.dataG04 = "N";
                            });

                            checkDataReady();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: (size.width / 2) - 10,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.1,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0),
                              ),
                              color: this.dataG04 == 'N'
                                  ? Colors.red
                                  : Color(0xFFdfdfdf),
                            ),
                            child: Text(
                              "No",
                              style: TextStyle(fontSize: size.width / 18),
                              textAlign: TextAlign.center,
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
          ],
        );
      } else {
        return Container();
      }
    }

    Widget buttonCheck() {
      if (this.isResult == false) {
        if (this.isReady == true) {
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
                  if (this.dataG01 == "Y") {
                    if (this.dataG02 == "Y") {
                      if (this.dataG03 == "Y") {
                        if (this.dataG04 == "Y") {
                          // Pertama
                          setState(() {
                            this.title = "SUSPECT";
                            this.desc = descSuspect;
                            this.image = "assets/images/diagnosis/suspect.png";
                            this.isResult = true;
                          });
                        } else if (this.dataG04 == "N") {
                          // Kedua
                          setState(() {
                            this.title = "PUS";
                            this.desc = descPDP;
                            this.image = "assets/images/diagnosis/pdp.png";
                            this.isResult = true;
                          });
                        }
                      } else if (this.dataG03 == "N") {
                        // Ketiga
                        setState(() {
                          this.title = "PIM";
                          this.desc = descODP;
                          this.image = "assets/images/diagnosis/odp.png";
                          this.isResult = true;
                        });
                      }
                    } else if (this.dataG02 == "N") {
                      if (this.dataG03 == "Y") {
                        if (this.dataG04 == "Y") {
                          // Keempat
                          setState(() {
                            this.title = "PUS";
                            this.desc = descPDP;
                            this.image = "assets/images/diagnosis/pdp.png";
                            this.isResult = true;
                          });
                        } else if (this.dataG04 == "N") {
                          // Kelima
                          setState(() {
                            this.title = "PIM";
                            this.desc = descODP;
                            this.image = "assets/images/diagnosis/odp.png";
                            this.isResult = true;
                          });
                        }
                      } else if (this.dataG03 == "N") {
                        // Keenam
                        setState(() {
                          this.title = "PWS";
                          this.desc = descOTG;
                          this.image = "assets/images/diagnosis/otg.png";
                          this.isResult = true;
                        });
                      }
                    }
                  } else if (this.dataG01 == "N") {
                    if (this.dataG02 == "Y") {
                      if (this.dataG03 == "Y") {
                        if (this.dataG04 == "Y") {
                          // Ketujuh
                          setState(() {
                            this.title = "SUSPECT";
                            this.desc = descSuspect;
                            this.image = "assets/images/diagnosis/suspect.png";
                            this.isResult = true;
                          });
                        } else if (this.dataG04 == "N") {
                          // Kedelapan
                          setState(() {
                            this.title = "PUS";
                            this.desc = descPDP;
                            this.image = "assets/images/diagnosis/pdp.png";
                            this.isResult = true;
                          });
                        }
                      } else if (this.dataG03 == "N") {
                        // Kesembilan
                        setState(() {
                          this.title = "PIM";
                          this.desc = descODP;
                          this.image = "assets/images/diagnosis/odp.png";
                          this.isResult = true;
                        });
                      }
                    } else if (this.dataG02 == "N") {
                      if (this.dataG03 == "Y") {
                        if (this.dataG04 == "Y") {
                          // Kesepuluh
                          setState(() {
                            this.title = "PUS";
                            this.desc = descPDP;
                            this.image = "assets/images/diagnosis/pdp.png";
                            this.isResult = true;
                          });
                        } else if (this.dataG04 == "N") {
                          // Kesebelas
                          setState(() {
                            this.title = "FEVER";
                            this.desc = descDemam;
                            this.image = "assets/images/diagnosis/demam.png";
                            this.isResult = true;
                          });
                        }
                      } else if (this.dataG03 == "N") {
                        // Keduabelas
                        setState(() {
                          this.title = "NORMAL";
                          this.desc = descNormal;
                          this.image = "assets/images/diagnosis/normal.png";
                          this.isResult = true;
                        });
                      }
                    }
                  }
                },
                child: new Text(
                  "See Result",
                  style: new TextStyle(
                      fontSize: size.width / 20,
                      color: Colors.white,
                      fontFamily: 'ProximaBold'),
                ),
              ),
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            width: double.infinity,
            height: size.width / 8,
            child: ButtonTheme(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0),
              ),
              buttonColor: Colors.grey,
              minWidth: double.infinity,
              height: size.width / 8,
              child: RaisedButton(
                onPressed: () {},
                child: new Text(
                  "See Result",
                  style: new TextStyle(
                      fontSize: size.width / 20,
                      color: Colors.white,
                      fontFamily: 'ProximaBold'),
                ),
              ),
            ),
          );
        }
      } else {
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
                setState(() {
                  this.isResult = false;
                });
              },
              child: new Text(
                "Change Answer",
                style: new TextStyle(
                    fontSize: size.width / 20,
                    color: Colors.white,
                    fontFamily: 'ProximaBold'),
              ),
            ),
          ),
        );
      }
    }

    Widget containerQuestion() {
      if (this.isResult == false) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
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

              // QUESTION
              Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment(0.0, 0.0),
                    child: Text(
                      "ANSWER A QUESTION",
                      style: TextStyle(
                        fontSize: size.width / header,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // G01
                  Container(
                    child: Container(
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
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Have you ever traveled to a city or country that was exposed to the COVID-19 virus ?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: size.width / 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    this.dataG01 = "Y";
                                  });

                                  checkDataReady();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: (size.width / 2) - 10,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                    color: this.dataG01 == 'Y'
                                        ? colorSecond
                                        : Color(0xFFdfdfdf),
                                  ),
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(fontSize: size.width / 18),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    this.dataG01 = "N";
                                  });

                                  checkDataReady();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: (size.width / 2) - 10,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                    color: this.dataG01 == 'N'
                                        ? Colors.red
                                        : Color(0xFFdfdfdf),
                                  ),
                                  child: Text(
                                    "No",
                                    style: TextStyle(fontSize: size.width / 18),
                                    textAlign: TextAlign.center,
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

                  // G02
                  Container(
                    child: Container(
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
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Have you ever been in direct contact with someone infected with the COVID-19 virus ?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: size.width / 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    this.dataG02 = "Y";
                                  });

                                  checkDataReady();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: (size.width / 2) - 10,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                    color: this.dataG02 == 'Y'
                                        ? colorSecond
                                        : Color(0xFFdfdfdf),
                                  ),
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(fontSize: size.width / 18),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    this.dataG02 = "N";
                                  });

                                  checkDataReady();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: (size.width / 2) - 10,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                    color: this.dataG02 == 'N'
                                        ? Colors.red
                                        : Color(0xFFdfdfdf),
                                  ),
                                  child: Text(
                                    "No",
                                    style: TextStyle(fontSize: size.width / 18),
                                    textAlign: TextAlign.center,
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

                  // G03
                  Container(
                    child: Container(
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
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Do you have a fever with body temperature reaching 38 degrees Celsius or more ?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: size.width / 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    this.dataG03 = "Y";
                                    this.dataG04 = "";
                                  });

                                  checkDataReady();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: (size.width / 2) - 10,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                    color: this.dataG03 == 'Y'
                                        ? colorSecond
                                        : Color(0xFFdfdfdf),
                                  ),
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(fontSize: size.width / 18),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    this.dataG03 = "N";
                                    this.dataG04 = "";
                                  });

                                  checkDataReady();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: (size.width / 2) - 10,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.1,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                    color: this.dataG03 == 'N'
                                        ? Colors.red
                                        : Color(0xFFdfdfdf),
                                  ),
                                  child: Text(
                                    "No",
                                    style: TextStyle(fontSize: size.width / 18),
                                    textAlign: TextAlign.center,
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

                  cardG04(),

                  SizedBox(height: (size.width / 8) + 10),
                ],
              ),
            ],
          ),
        );
      } else {
        return Container(
          color: Color(0xFFdef8ff),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: size.width / 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 3,
                    child: Image.asset(image),
                  ),
                  Container(
                    width: size.width / 1.5,
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                      desc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width / header,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.5,
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      "The results of this diagnosis are only estimates. We do not recommend that you fully trust the results of this diagnosis. For better results we recommend checking the COVID-19 virus directly.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width / 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    }

    return Scaffold(
      body: containerQuestion(),
      floatingActionButton: buttonCheck(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
