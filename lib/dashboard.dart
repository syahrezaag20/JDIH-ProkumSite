// import 'package:contohan2/providers/prokum_provider.dart';
import 'package:flutter/material.dart';
import 'package:jdih_app_mobile/home.dart';
import 'package:jdih_app_mobile/about.dart';
import 'package:jdih_app_mobile/search.dart';
import 'package:jdih_app_mobile/theme.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _bottomNavIndex = 0;

  //list of the page
  List<Widget> pages = const [Home(), About()];

  List<IconData> iconList = [
    Icons.home,
    Icons.info,
  ];

  List<String> titleList = [
    "Selamat Datang di Aplikasi\n JDIH Kabupaten Magetan",
    "About",
  ];

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
                titleList[_bottomNavIndex],
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
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const Search(), type: PageTransitionType.bottomToTop));
        },
        child: Icon(Icons.search),
        backgroundColor: primaryHome,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: primaryHome,
        activeColor: primaryHome,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
