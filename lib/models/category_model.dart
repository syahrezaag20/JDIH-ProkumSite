class CategoryModel {
  int id = 1;
  String name = 'Peraturan Bupati';

  CategoryModel({
    required this.id,
    required this.name,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nama_kategori'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
