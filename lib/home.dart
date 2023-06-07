import 'package:flutter/material.dart';
import 'package:jdih_app_mobile/chart.dart';
import 'package:jdih_app_mobile/instruksi_bupati.dart';
import 'package:jdih_app_mobile/kepbup.dart';
import 'package:jdih_app_mobile/perbup.dart';
import 'package:jdih_app_mobile/perda.dart';
import 'package:jdih_app_mobile/perdes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        crossAxisCount: 3,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Perda()));
              },
              splashColor: Colors.lightBlue.shade300,
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.only(top: 10, bottom: 15),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Color(0xfff54337),
                          borderRadius: BorderRadius.circular(50)),
                      child: Image.asset(
                        'lib/icons/courthouse.png',
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Peraturan Daerah",
                      style: TextStyle(fontSize: 11.0, fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Perbup()));
              },
              splashColor: Colors.lightBlue.shade300,
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.only(top: 10, bottom: 15),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Color(0xffff5616),
                          borderRadius: BorderRadius.circular(50)),
                      child: Image.asset(
                        'lib/icons/briefcase2.png',
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Peraturan Bupati",
                      style: TextStyle(fontSize: 11.0, fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Kepbup()));
              },
              splashColor: Colors.lightBlue.shade300,
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.only(top: 10, bottom: 15),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Color(0xffff9801),
                          borderRadius: BorderRadius.circular(50)),
                      child: Image.asset(
                        'lib/icons/gavel3.png',
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Keputusan Bupati",
                      style: TextStyle(fontSize: 11.0, fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const InstruksiBupati()));
              },
              splashColor: Colors.lightBlue.shade300,
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Color(0xff4cb050),
                          borderRadius: BorderRadius.circular(50)),
                      child: Image.asset(
                        'lib/icons/megaphone3.png',
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Instruksi Bupati",
                      style: TextStyle(fontSize: 11.0, fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Perdes()));
              },
              splashColor: Colors.lightBlue.shade300,
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.only(top: 10, bottom: 15),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Color(0xff039488),
                          borderRadius: BorderRadius.circular(50)),
                      child: Image.asset(
                        'lib/icons/paper.png',
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Peraturan Desa",
                      style: TextStyle(fontSize: 11.0, fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Chart()));
              },
              splashColor: Colors.lightBlue.shade300,
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.only(top: 10, bottom: 15),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Color(0xff2196f3),
                          borderRadius: BorderRadius.circular(50)),
                      child: Image.asset(
                        'lib/icons/diagram3.png',
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Grafik",
                      style: TextStyle(fontSize: 11.0, fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
