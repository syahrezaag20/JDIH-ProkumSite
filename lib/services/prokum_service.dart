import 'dart:convert';
import 'package:jdih_app_mobile/models/prokum_model.dart';
import 'package:http/http.dart' as http;

class ProkumService {
  String basUrl = 'https://api.jdih-prokum.site/api/prokum?limit=15';
  // String basUrl = 'http://10.0.2.2/api/prokum?limit=15';

  Future<List<ProkumModel>> getProkums(
      {String page = '1', String nama = '', String kategori = ''}) async {
    var url = Uri.parse('$basUrl' +
        '&kategori=' +
        kategori +
        '&page=' +
        page +
        '&nama=' +
        nama);

    var headers = {'Content-type': 'application/json'};
    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProkumModel> prokums = [];

      for (var item in data) {
        prokums.add(ProkumModel.fromJson(item));
      }
      return prokums;
    } else {
      throw Exception('gagal get Prokum');
    }
  }
}
