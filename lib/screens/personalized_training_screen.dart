import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '/models/user_data.dart';

class PersonalizedTrainingScreen extends StatefulWidget {
  final UserData userData;

  const PersonalizedTrainingScreen({Key? key, required this.userData})
      : super(key: key);

  @override
  State<PersonalizedTrainingScreen> createState() =>
      _PersonalizedTrainingScreenState();
}

class _PersonalizedTrainingScreenState
    extends State<PersonalizedTrainingScreen> {
  String? planoGerado;
  bool carregando = false;
  String? erro;

  final String apiKey =
      'AIzaSyCkyczA47f9PpcKcP20dHU2AKZviU9emZg'; // Substitua com sua chave da API Gemini

  @override
  void initState() {
    super.initState();
    gerarPlanoComGemini();
  }

  Future<void> gerarPlanoComGemini() async {
    setState(() {
      carregando = true;
      erro = null;
    });

    final prompt = '''
Você é um treinador profissional. Crie um plano de treino semanal altamente estruturado e visualmente organizado para o atleta ${widget.userData.name}.

Detalhes:
- Nível: ${widget.userData.activityLevel}
- Modalidade: ${widget.userData.modality}
- Objetivo: ${widget.userData.goal}
- Disponibilidade diária:
${widget.userData.dailyTrainingHours.entries.map((e) => '- ${e.key}: ${e.value}h').join('\n')}

Regras do plano:
1. Crie sessões de treino de segunda a domingo, respeitando as horas disponíveis de cada dia.
2. Cada dia deve conter:
   - Um **título com o nome do dia** (ex: Monday)
   - **Nome do treino**
   - **Breve descrição** com duração e intensidade (ex: "20 min @ 116–140 bpm")
   - **Descrição detalhada do objetivo da sessão** (ex: quais zonas de treino são trabalhadas e propósito fisiológico)
   - Quando aplicável, inclua seções como:
     - Warm up
     - Main Set (com subitens numerados e repetições, se necessário)
     - Cool Down
   - Utilize espaçamento e estruturação visual semelhante a este modelo:

Monday  
**Warm up**  
20 min @ 116–140 bpm  
Zone 1: Recovery – Zone 2: Aerobic  

**Repeat 5 times**  
1. Hard  
20 sec @ 172–190 bpm  
Zone 4: SubThreshold – Zone 5: SuperThreshold  
...  

**Cool Down**  
10 min @ 116–130 bpm  
Zone 1: Recovery  

3. Utilize uma linguagem clara, concisa, e com aparência padronizada como acima.
4. Retorne o conteúdo em formato **plaintext**, sem HTML, markdown ou emojis.

O plano deve ser acessível a um atleta com o perfil descrito, e deve variar os treinos ao longo da semana conforme as zonas de intensidade e a recuperação esperada.
''';

    try {
      final model = GenerativeModel(
        model: 'models/gemini-2.0-flash',
        apiKey: apiKey,
      );

      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      setState(() {
        planoGerado = response.text;
        carregando = false;
      });
    } catch (e) {
      setState(() {
        erro = 'Erro ao gerar plano: $e';
        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plano de Treino Personalizado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: carregando
            ? const Center(child: CircularProgressIndicator())
            : erro != null
                ? Text(erro!)
                : SingleChildScrollView(
                    child: Text(planoGerado ?? 'Nenhuma resposta.')),
      ),
    );
  }
}
