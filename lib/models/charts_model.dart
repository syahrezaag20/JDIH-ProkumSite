class ChartsModel {
  int jumlah_prokum = 1;
  int id_kategori = 1;
  String kategori = 'Peraturan Bupati';

  ChartsModel({
    required this.jumlah_prokum,
    required this.kategori,
  });

  ChartsModel.fromJson(Map<String, dynamic> json) {
    id_kategori = json['id_kategori'];
    jumlah_prokum = json['jumlah_prokum'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id_kategori': id_kategori,
      'jumlah_prokum': jumlah_prokum,
      'kategori': kategori,
    };
  }
}
