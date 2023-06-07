import 'package:jdih_app_mobile/models/charts_model.dart';
import 'package:jdih_app_mobile/services/charts_service.dart';
import 'package:flutter/material.dart';

class ChartsProvider with ChangeNotifier {
  List<ChartsModel> _charts = [];

  List<ChartsModel> get charts => _charts;

  set charts(List<ChartsModel> charts) {
    _charts = charts;
    notifyListeners();
  }

  Future<void> getCharts() async {
    try {
      List<ChartsModel> charts = await ChartsService().getCharts();
      _charts = charts;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
