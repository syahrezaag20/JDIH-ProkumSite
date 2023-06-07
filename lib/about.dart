import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(
              Icons.info,
              size: 50,
              color: Colors.black,
            ),
            title: new Text("Tentang Aplikasi"),
          ),
          new ListTile(
            leading: new Icon(
              Icons.people,
              size: 50,
              color: Colors.black,
            ),
            title: new Text("Visi dan Misi"),
          ),
        ],
      ),
    );
  }
}
