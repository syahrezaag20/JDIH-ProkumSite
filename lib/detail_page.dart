import 'package:flutter/material.dart';
import 'package:jdih_app_mobile/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  String? prokum;
  DetailPage({Key? key, this.prokum}) : super(key: key);
  bool isLoading = true;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 120,
            title: Center(
              child: Text(
                "Detail Page",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
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
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () async {
                    if (!await launchUrl(Uri.parse(
                        'googlechrome://navigate?url=https://api.jdih-prokum.site/${widget.prokum}'))) {
                      throw Exception('Could Not Launch');
                    }
                  },
                  icon: Icon(
                    Icons.download,
                  ))
            ],
            //centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      colors: [primaryHome, gradientHome],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
            ),
          ),
          preferredSize: Size.fromHeight(130)),
      body: Column(
        children: [
          Expanded(
            child: SfPdfViewer.network(
                'https://api.jdih-prokum.site/${widget.prokum}'),
          ),
        ],
      ),
    );
  }
}
