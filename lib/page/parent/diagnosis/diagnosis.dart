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
      "Anda tidak ada gejala kelainan berat apapun. Begitu pula tidak ada kondisi yang menyebabkan Anda perlu dipantau perkembangan kesehatannya akibat wabah COVID-19.";
  var descDemam =
      "Anda memiliki gejala demam namun tidak ada tanda bahwa anda terpapar virus COVID-19. Tetap isolasi diri Anda hingga sembuh dan lakukan social distancing.";
  var descOTG =
      "Anda (Orang Tanpa Gejala) tidak memiliki gejala yang terjadi pada wabah COVID-19. Namun anda memiliki riwayat berkunjung kedaerah yang terpapar virus COVID-19. Isolasi diri Anda dan lakukan social distancing minimal 14 hari.";
  var descODP =
      "Anda (Orang Dalam Pemantauan) tidak memiliki gejala yang terjadi pada wabah COVID-19. Namun anda memiliki riwayat kontak langsung dengan suspect virus COVID-19 segera isolasi diri Anda dan kunjungi RS Rujukan COVID-19 terdekat.";
  var descPDP =
      "Anda (Pasien Dalam Pengawasan) memiliki beberapa gejala yang mirip terjadi pada wabah COVID-19. kemungkinan besar anda terpapar virus COVID-19 segera isolasi diri Anda dan kunjungi RS Rujukan COVID-19 terdekat.";
  var descSuspect =
      "Anda diduga memiliki semua gejala yang mirip terjadi pada wabah COVID-19. kemungkinan besar anda terpapar virus COVID-19 segera isolasi diri Anda dan kunjungi RS Rujukan COVID-19 terdekat.";

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
                        "Apakah anda mengalami ganggunan pernafasan yang cukup berat ?",
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
                              "Ya",
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
                              "Tidak",
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
                            this.title = "PDP";
                            this.desc = descPDP;
                            this.image = "assets/images/diagnosis/pdp.png";
                            this.isResult = true;
                          });
                        }
                      } else if (this.dataG03 == "N") {
                        // Ketiga
                        setState(() {
                          this.title = "ODP";
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
                            this.title = "PDP";
                            this.desc = descPDP;
                            this.image = "assets/images/diagnosis/pdp.png";
                            this.isResult = true;
                          });
                        } else if (this.dataG04 == "N") {
                          // Kelima
                          setState(() {
                            this.title = "ODP";
                            this.desc = descODP;
                            this.image = "assets/images/diagnosis/odp.png";
                            this.isResult = true;
                          });
                        }
                      } else if (this.dataG03 == "N") {
                        // Keenam
                        setState(() {
                          this.title = "OTG";
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
                            this.title = "PDP";
                            this.desc = descPDP;
                            this.image = "assets/images/diagnosis/pdp.png";
                            this.isResult = true;
                          });
                        }
                      } else if (this.dataG03 == "N") {
                        // Kesembilan
                        setState(() {
                          this.title = "ODP";
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
                            this.title = "PDP";
                            this.desc = descPDP;
                            this.image = "assets/images/diagnosis/pdp.png";
                            this.isResult = true;
                          });
                        } else if (this.dataG04 == "N") {
                          // Kesebelas
                          setState(() {
                            this.title = "DEMAM";
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
                  "Proses Diagnosa",
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
                  "Proses Diagnosa",
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
                "Ubah Jawaban",
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
                      "JAWAB PERTANYAAN",
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
                              "Apakah anda pernah bepergian ke kota atau negara yang terpapar virus COVID-19 ?",
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
                                    "Ya",
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
                                    "Tidak",
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
                              "Apakah anda pernah kontak langsung dengan orang yang terinfeksi virus COVID-19 ?",
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
                                    "Ya",
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
                                    "Tidak",
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
                              "Apakah anda mengalami demam dengan suhu tubuh mencapai 38 derajat Celcius ?",
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
                                    "Ya",
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
                                    "Tidak",
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
                      "Hasil diagnosa ini hanya berupa perkiraan kami tidak menyarankan Anda untuk percaya sepenuhnya dengan hasil diagnosa ini. Untuk hasil yang lebih baik kami menyarankan untuk melakukan pemeriksaan virus COVID-19 secara langsung.",
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
