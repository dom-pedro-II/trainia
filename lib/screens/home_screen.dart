import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'historico_screen.dart';
import 'preferencias_treino_screen.dart';

class HomeScreen extends StatelessWidget {
  final UserModel user;

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HistoricoScreen()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Olá, ${user.name} 👋', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            const Text('Vamos começar um novo plano de treino?'),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.fitness_center),
                label: const Text('Novo Treino'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PreferenciasTreinoScreen(user: user)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
