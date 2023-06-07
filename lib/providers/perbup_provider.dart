import 'package:jdih_app_mobile/models/prokum_model.dart';
import 'package:jdih_app_mobile/services/prokum_service.dart';
import 'package:flutter/material.dart';

class PerbupProvider with ChangeNotifier {
  List<ProkumModel> _prokums = [];

  List<ProkumModel> get prokums => _prokums;

  set prokums(List<ProkumModel> prokums) {
    _prokums = prokums;
    notifyListeners();
  }

  Future<void> getProkums({page, kategori}) async {
    try {
      List<ProkumModel> prokums =
          await ProkumService().getProkums(page: page, kategori: kategori);
      _prokums = prokums;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadMore({page, kategori}) async {
    try {
      List<ProkumModel> prokums =
          await ProkumService().getProkums(page: page, kategori: kategori);
      _prokums = _prokums + prokums;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
