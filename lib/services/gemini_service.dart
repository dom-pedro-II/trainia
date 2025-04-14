class GeminiService {
  static Future<String> enviarPrompt(String prompt) async {
    // Aqui você deve integrar com a API real do Gemini.
    // Para testes, devolvemos um JSON simulado.
    return '''
{
  "segunda": "30min de pedal leve",
  "terça": "Treino intervalado de 1h",
  "quarta": "Descanso ativo",
  "quinta": "Força na academia + 40min de bike",
  "sexta": "1h de treino contínuo",
  "sábado": "Treino longo: 2h de estrada",
  "domingo": "Recuperação: yoga ou caminhada"
}
''';
  }
}
