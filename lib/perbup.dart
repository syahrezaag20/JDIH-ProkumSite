import 'package:jdih_app_mobile/providers/perbup_provider.dart';
import 'package:jdih_app_mobile/widget/prokum_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Perbup extends StatefulWidget {
  const Perbup({super.key});
  @override
  _Perbup createState() => _Perbup();
}

class _Perbup extends State<Perbup> {
  final scrollController = ScrollController();
  bool isLoadingMore = false;
  int page = 1;
  String kategori = '2';
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    final PerbupProvider perbupProvider = Provider.of<PerbupProvider>(context);
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 120,
              title: Center(
                child: Text(
                  "Peraturan Bupati",
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
                        colors: [Color(0xffff5616), Color(0xffe54d13)],
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
                ? perbupProvider.prokums.length + 1
                : perbupProvider.prokums.length,
            itemBuilder: (context, index) {
              if (index < perbupProvider.prokums.length) {
                final data = perbupProvider.prokums[index];
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
    await Provider.of<PerbupProvider>(context, listen: false)
        .getProkums(page: page.toString(), kategori: kategori);
    page = 1;
  }

  Future<void> fetchProkums(String page) async {
    PerbupProvider prokumProvider =
        Provider.of<PerbupProvider>(context, listen: false);
    await Provider.of<PerbupProvider>(context, listen: false)
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
