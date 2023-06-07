import 'dart:convert';
import 'package:jdih_app_mobile/models/charts_model.dart';
import 'package:http/http.dart' as http;

class ChartsService {
  String basUrl = 'https://api.jdih-prokum.site/api/chart';
  // String basUrl = 'http://10.0.2.2/api/chart';

  Future<List<ChartsModel>> getCharts() async {
    var url = Uri.parse('$basUrl');

    var headers = {'Content-type': 'application/json'};
    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<ChartsModel> charts = [];

      for (var item in data) {
        charts.add(ChartsModel.fromJson(item));
      }
      return charts;
    } else {
      throw Exception('gagal get Charts');
    }
  }
}
