import 'package:jdih_app_mobile/detail_page.dart';
import 'package:jdih_app_mobile/models/prokum_model.dart';
import 'package:flutter/material.dart';
import 'package:jdih_app_mobile/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ProkumTile extends StatelessWidget {
  final ProkumModel prokum;
  ProkumTile(this.prokum);
  // final baseUrl = 'http://10.0.2.2/';
  // final ur = this.prokum.path_file;
  // final Uri _url = Uri.parse(this.prokum.path_file);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(prokum: prokum.path_file),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          top: 4.0,
          left: 4.0,
          right: 4.0,
          bottom: 4.0,
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Icon(
                  Icons.picture_as_pdf,
                  size: 50,
                )),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prokum.kategori.name,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  prokum.nama,
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch');
  //   }
  // }
}
