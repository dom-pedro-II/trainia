import 'package:flutter/material.dart';
import 'dart:convert';

class ResultadoTreinoScreen extends StatelessWidget {
  final String resultadoJson;

  const ResultadoTreinoScreen({super.key, required this.resultadoJson});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> treino = jsonDecode(resultadoJson);

    return Scaffold(
      appBar: AppBar(title: const Text('Seu plano da semana')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: treino.entries.map((entry) {
            return Card(
              child: ListTile(
                title: Text(entry.key.toUpperCase()),
                subtitle: Text(entry.value),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
