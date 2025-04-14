import '../utils/file_helper.dart';

class HistoricoService {
  static const _file = 'historico_treinos.json';

  static Future<List<Map<String, dynamic>>> listar() async {
    final data = await FileHelper.readJson(_file);
    if (data == null) return [];
    return List<Map<String, dynamic>>.from(data);
  }

  static Future<void> salvar(Map<String, dynamic> treino) async {
    final lista = await listar();
    lista.insert(0, treino);
    await FileHelper.writeJson(_file, lista);
  }
}
