import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/treino_service.dart';
import 'resultado_treino_screen.dart';

class PreferenciasTreinoScreen extends StatefulWidget {
  final UserModel user;

  const PreferenciasTreinoScreen({super.key, required this.user});

  @override
  State<PreferenciasTreinoScreen> createState() => _PreferenciasTreinoScreenState();
}

class _PreferenciasTreinoScreenState extends State<PreferenciasTreinoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _objetivoController = TextEditingController();
  final _equipamentosController = TextEditingController();

  final Map<String, TextEditingController> _horarios = {
    'segunda': TextEditingController(),
    'terça': TextEditingController(),
    'quarta': TextEditingController(),
    'quinta': TextEditingController(),
    'sexta': TextEditingController(),
    'sábado': TextEditingController(),
    'domingo': TextEditingController(),
  };

  bool _carregando = false;

  Future<void> _gerarTreino() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _carregando = true);

    final resultado = await TreinoService.gerarTreino(
      nome: widget.user.name,
      idade: widget.user.age,
      tamanho: widget.user.height,
      peso: widget.user.weight,
      nivel: widget.user.activityLevel,
      modality: widget.user.sportsModality,
      objetivo: _objetivoController.text,
      equipaments: _equipamentosController.text,
      horarios: _horarios.map((k, v) => MapEntry(k, v.text)),
    );

    setState(() => _carregando = false);

    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultadoTreinoScreen(resultadoJson: resultado),
        ),
      );
    }
  }

  @override
  void dispose() {
    for (var c in _horarios.values) {
      c.dispose();
    }
    _objetivoController.dispose();
    _equipamentosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferências de Treino')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _objetivoController,
                decoration: const InputDecoration(labelText: 'Objetivo do treino'),
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                controller: _equipamentosController,
                decoration: const InputDecoration(labelText: 'Equipamentos disponíveis'),
              ),
              const SizedBox(height: 16),
              const Text('Disponibilidade por dia (horas):'),
              const SizedBox(height: 8),
              ..._horarios.entries.map((e) => TextFormField(
                    controller: e.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: '${e.key[0].toUpperCase()}${e.key.substring(1)}'),
                  )),
              const SizedBox(height: 24),
              _carregando
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _gerarTreino,
                      child: const Text('Gerar Plano de Treino'),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
