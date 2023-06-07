import 'package:jdih_app_mobile/providers/instruksibupati_provider.dart';
import 'package:jdih_app_mobile/widget/prokum_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstruksiBupati extends StatefulWidget {
  const InstruksiBupati({super.key});
  @override
  _InstruksiBupati createState() => _InstruksiBupati();
}

class _InstruksiBupati extends State<InstruksiBupati> {
  final scrollController = ScrollController();
  bool isLoadingMore = false;
  int page = 1;
  String kategori = '4';
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    final InstruksiBupatiProvider instruksibupatiProvider =
        Provider.of<InstruksiBupatiProvider>(context);
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 120,
              title: Center(
                child: Text(
                  "Instruksi Bupati",
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
                        colors: [Color(0xff4cb050), Color(0xff449e48)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            preferredSize: Size.fromHeight(130)),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            controller: scrollController,
            itemCount: isLoadingMore
                ? instruksibupatiProvider.prokums.length + 1
                : instruksibupatiProvider.prokums.length,
            itemBuilder: (context, index) {
              if (index < instruksibupatiProvider.prokums.length) {
                final data = instruksibupatiProvider.prokums[index];
                return ProkumTile(data);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }

  Future<void> refresh() async {
    await Provider.of<InstruksiBupatiProvider>(context, listen: false)
        .getProkums(page: page.toString(), kategori: kategori);
    page = 1;
  }

  Future<void> fetchProkums(String page) async {
    InstruksiBupatiProvider prokumProvider =
        Provider.of<InstruksiBupatiProvider>(context, listen: false);
    await Provider.of<InstruksiBupatiProvider>(context, listen: false)
        .loadMore(page: page, kategori: kategori);
    setState(() {
      prokumProvider.prokums = prokumProvider.prokums;
    });
  }

  Future<void> _scrollListener() async {
    if (isLoadingMore) {
      return;
    }
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMore = true;
      });
      page = page + 1;
      print('scrol ke ' + page.toString());
      await fetchProkums(page.toString());
      setState(() {
        isLoadingMore = false;
      });
    }
  }
}
