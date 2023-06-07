import 'package:jdih_app_mobile/providers/charts_provider.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});
  @override
  _Chart createState() => _Chart();
}

class _Chart extends State<Chart> {
  bool isLoadingMore = false;
  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    final ChartsProvider chartsProvider = Provider.of<ChartsProvider>(context);
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 120,
              title: Center(
                child: Text(
                  "Grafik",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                      // shadows: [
                      //   Shadow(
                      //     offset: Offset(-1, -1),
                      //     color: Colors.black,
                      //   ),
                      //   Shadow(
                      //     offset: Offset(1, -1),
                      //     color: Colors.black,
                      //   ),
                      //   Shadow(
                      //     offset: Offset(-1, 1),
                      //     color: Colors.black,
                      //   ),
                      //   Shadow(
                      //     offset: Offset(1, 1),
                      //     color: Colors.black,
                      //   ),
                      // ]
                    ),
                ),
              ),
              //centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                        colors: [Color(0xff2196f3), Color(0xff1d87da)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            preferredSize: Size.fromHeight(130)),
        body: Column(
          children: [
            ListTile(
              title: Text('Grafik Jumlah Berdasarkan kategori'),
              tileColor: Colors.purple[200],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartPie(
                  data: chartsProvider.charts.map((chart) {
                    return {
                      'id_kategori': chart.id_kategori,
                      'domain': chart.kategori,
                      'measure': chart.jumlah_prokum
                    };
                  }).toList(),
                  fillColor: (pieData, index) {
                    switch (pieData['id_kategori']) {
                      case 1:
                        return Colors.blue[500];
                      case 2:
                        return Colors.blue[400];
                      case 3:
                        return Colors.blue[300];
                      case 4:
                        return Colors.blue[200];
                      default:
                        return Colors.blue[100];
                    }
                  },
                  pieLabel: (pieData, index) {
                    return "${pieData['domain']}:\n${pieData['measure']}%";
                  },
                  labelPosition: PieLabelPosition.outside,
                ),
              ),
            )
          ],
        ));
  }

  Future<void> refresh() async {
    await Provider.of<ChartsProvider>(context, listen: false).getCharts();
  }
}
