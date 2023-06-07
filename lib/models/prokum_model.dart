import 'package:jdih_app_mobile/models/category_model.dart';

class ProkumModel {
  int? id;
  String nama = '';
  String? nama_file;
  String path_file = '';
  String? deskripsi;
  DateTime? created_at;
  DateTime? updated_at;
  CategoryModel kategori = CategoryModel(id: 1, name: 'Category 1');

  ProkumModel({
    this.id,
    required this.nama,
    this.nama_file,
    required this.path_file,
    this.deskripsi,
    required this.kategori,
    this.created_at,
    this.updated_at,
  });

  ProkumModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    nama_file = json['nama_file'];
    path_file = json['path_file'];
    deskripsi = json['deskripsi'];
    kategori = CategoryModel.fromJson(json['category']);
    created_at = DateTime.parse(json['created_at']);
    updated_at = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nama_file': nama_file,
      'path_file': path_file,
      'deskripsi': deskripsi,
      'categori': kategori.toJson(),
      'created_at': created_at.toString(),
      'update_at': updated_at.toString(),
    };
  }
}
