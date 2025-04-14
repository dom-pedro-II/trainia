class TreinoModel {
  final Map<String, String> planoSemanal;

  TreinoModel({required this.planoSemanal});

  Map<String, dynamic> toMap() {
    return planoSemanal;
  }

  factory TreinoModel.fromMap(Map<String, dynamic> map) {
    final plano = map.map((key, value) => MapEntry(key, value.toString()));
    return TreinoModel(planoSemanal: plano);
  }
}
