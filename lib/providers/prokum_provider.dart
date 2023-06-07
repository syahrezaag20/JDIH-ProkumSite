import 'package:jdih_app_mobile/models/prokum_model.dart';
import 'package:jdih_app_mobile/services/prokum_service.dart';
import 'package:flutter/material.dart';

class ProkumProvider with ChangeNotifier {
  List<ProkumModel> _prokums = [];
  List<ProkumModel> _searchprokums = [];

  List<ProkumModel> get prokums => _prokums;
  List<ProkumModel> get searchprokums => _searchprokums;

  set prokums(List<ProkumModel> prokums) {
    _prokums = prokums;
    notifyListeners();
  }

  set searchprokums(List<ProkumModel> searchprokums) {
    _searchprokums = searchprokums;
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

  Future<void> loadMoreSearch({page, kategori}) async {
    try {
      List<ProkumModel> searchprokums =
          await ProkumService().getProkums(page: page, kategori: kategori);
      _searchprokums = _searchprokums + searchprokums;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> searchProkum({page, nama, kategori}) async {
    try {
      List<ProkumModel> searchprokums = await ProkumService()
          .getProkums(page: page, nama: nama, kategori: kategori);
      _searchprokums = searchprokums;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> clearSearchProkums() async {
    searchprokums = [];
    _searchprokums = [];
    searchprokums.clear();
    _searchprokums.clear();
    _searchprokums = searchprokums;
    notifyListeners();
  }
}
