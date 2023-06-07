import 'package:flutter/material.dart';
import 'package:jdih_app_mobile/providers/prokum_provider.dart';
import 'package:jdih_app_mobile/widget/prokum_tile.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  final scrollController = ScrollController();
  bool isLoadingMore = false;
  int page = 1;
  String name = '';
  String kategori = '';
  @override
  void initState() {
    // refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProkumProvider searchprokumProvider =
        Provider.of<ProkumProvider>(context);
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 120,
              title: Center(
                child: Text(
                  "Search",
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
                        colors: [primaryHome, gradientHome],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            preferredSize: Size.fromHeight(130)),
        body: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20, left: 15, right: 15), 
              child: TextField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      Future.delayed(const Duration(milliseconds: 1500), () {
                        searchprokumProvider.clearSearchProkums();
                        setState(() {
                          searchprokumProvider.searchprokums =
                              searchprokumProvider.searchprokums;
                        });
                        print('Kosong Data');
                      });
                    } else {
                      searchProkums('0', value);
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Cari Nama Dokumen",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                )
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            if (searchprokumProvider.searchprokums.isNotEmpty)
              Expanded(
                  child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                // itemCount: isLoadingMore,
                itemBuilder: (context, index) {
                  if (index < searchprokumProvider.searchprokums.length) {
                    final data = searchprokumProvider.searchprokums[index];
                    return ProkumTile(data);
                  }
                  return null;
                },
              ))
            else
              Expanded(child: Text('Hasil Pencarian Tidak Ada')),
          ],
        ));
  }

  Future<void> searchProkums(String page, String name) async {
    ProkumProvider searchprokumProvider =
        Provider.of<ProkumProvider>(context, listen: false);
    await Provider.of<ProkumProvider>(context, listen: false)
        .searchProkum(page: page, nama: name, kategori: kategori);
    setState(() {
      // prokumProvider.prokums = prokumProvider.prokums;
      searchprokumProvider.searchprokums = searchprokumProvider.searchprokums;
    });
  }
}
