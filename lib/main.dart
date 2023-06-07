import 'package:flutter/services.dart';
import 'package:jdih_app_mobile/perda.dart';
import 'package:jdih_app_mobile/perbup.dart';
import 'package:jdih_app_mobile/kepbup.dart';
import 'package:jdih_app_mobile/instruksi_bupati.dart';
import 'package:jdih_app_mobile/providers/charts_provider.dart';
import 'package:jdih_app_mobile/providers/kepbup_provider.dart';
import 'package:jdih_app_mobile/providers/prokum_provider.dart';
import 'package:jdih_app_mobile/providers/perbup_provider.dart';
import 'package:jdih_app_mobile/providers/instruksibupati_provider.dart';
import 'package:flutter/material.dart';
import 'package:jdih_app_mobile/dashboard.dart';
import 'package:jdih_app_mobile/splashscreen.dart';
import 'package:provider/provider.dart';

import 'providers/perdes_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProkumProvider()),
        ChangeNotifierProvider(create: (context) => PerbupProvider()),
        ChangeNotifierProvider(create: (context) => KepbupProvider()),
        ChangeNotifierProvider(create: (context) => InstruksiBupatiProvider()),
        ChangeNotifierProvider(create: (context) => PerdesProvider()),
        ChangeNotifierProvider(create: (context) => ChartsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: Dashboard(),
        routes: {
          '/': (context) => SplashScreen(),
          '/perda': (context) => Perda(),
          '/perbup': (context) => Perbup(),
          '/kepbup': (context) => Kepbup(),
          '/instruksibupati': (context) => InstruksiBupati(),
        },
      ),
    );
  }
}
