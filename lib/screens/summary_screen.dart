import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_data.dart';
import '../widgets/custom_nav_bar.dart';
import 'personalized_training_screen.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Resumo do Atleta")),
      bottomNavigationBar: CustomNavBar(currentIndex: 2),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "Dados Pessoais",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text("Nome: ${user.name}"),
            Text("Idade: ${user.age}"),
            Text("Altura: ${user.height} m"),
            Text("Peso: ${user.weight} kg"),
            const Divider(height: 32),
            const Text(
              "Informações de Treino",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text("Nível de Atividade: ${user.activityLevel}"),
            Text("Modalidade: ${user.modality}"),
            Text("Objetivo: ${user.goal}"),
            const Divider(height: 32),
            const Text(
              "Disponibilidade por dia:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            ...user.dailyTrainingHours.entries.map(
              (e) => Text(
                "${e.key}: ${e.value == 0 ? 'Indisponível' : '${e.value}h'}",
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.fitness_center),
              label: const Text("Gerar Treino Personalizado"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PersonalizedTrainingScreen(userData: user),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
