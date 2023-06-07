import 'package:jdih_app_mobile/models/prokum_model.dart';
import 'package:flutter/material.dart';

class ProkumPage extends StatefulWidget {
  final ProkumModel prokum;
  ProkumPage(this.prokum);

  @override
  _ProkumPageState createState() => _ProkumPageState();
}

class _ProkumPageState extends State<ProkumPage> {
  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Text('data');
    }

    return Scaffold(
      body: ListView(
        children: [
          content(),
        ],
      ),
    );
  }
}
