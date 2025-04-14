import 'dart:convert';
import 'gemini_service.dart';

class TreinoService {
  static Future<String> gerarTreino({
    required String nome,
    required int idade,
    required double tamanho,
    required double peso,
    required String nivel,
    required String modality,
    required String objetivo,
    required String equipaments,
    required Map<String, String> horarios,
  }) async {
    final prompt = '''
Você é um treinador esportivo inteligente e especializado em treinos personalizados com apoio de IA.

Crie um plano de treinos da semana no formato JSON, com sugestões para cada dia da semana, considerando:

**Informações do atleta:**
- Nome: $nome
- Idade: $idade anos
- Altura: ${tamanho.toStringAsFixed(2)}m
- Peso: ${peso.toStringAsFixed(1)}kg
- Nível de atividade esportiva: $nivel

**Disponibilidade de tempo (em horas por dia):**
- Segunda: ${horarios['segunda']}
- Terça: ${horarios['terça']}
- Quarta: ${horarios['quarta']}
- Quinta: ${horarios['quinta']}
- Sexta: ${horarios['sexta']}
- Sábado: ${horarios['sábado']}
- Domingo: ${horarios['domingo']}

**Modalidade treinada:** $modality  
**Equipamentos disponíveis:** $equipaments  
**Objetivo dos treinos:** $objetivo

**IMPORTANTE:**  
Responda **apenas** com um JSON neste formato:

{
  "segunda": "descrição do treino",
  "terça": "descrição do treino",
  "quarta": "descrição do treino",
  "quinta": "descrição do treino",
  "sexta": "descrição do treino",
  "sábado": "descrição do treino",
  "domingo": "descrição do treino"
}
''';

    return await GeminiService.enviarPrompt(prompt);
  }
}
