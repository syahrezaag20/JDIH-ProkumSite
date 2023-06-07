import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jdih_app_mobile/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff70ddfe), Color(0xff64c6e4)]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/logojdih.png",
                  height: 150.0,
                  width: 150.0,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(
                  "JARINGAN DOKUMENTASI INFORMASI HUKUM\n KABUPATEN MAGETAN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(-1, -1),
                          color: Colors.black,
                        ),
                        Shadow(
                          offset: Offset(1, -1),
                          color: Colors.black,
                        ),
                        Shadow(
                          offset: Offset(-1, 1),
                          color: Colors.black,
                        ),
                        Shadow(
                          offset: Offset(1, 1),
                          color: Colors.black,
                        ),
                      ]),
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                CircularProgressIndicator(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
