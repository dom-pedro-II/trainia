import 'package:flutter/material.dart';
import '../services/historico_service.dart';

class HistoricoScreen extends StatefulWidget {
  const HistoricoScreen({super.key});

  @override
  State<HistoricoScreen> createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  List<Map<String, dynamic>> _treinos = [];

  @override
  void initState() {
    super.initState();
    _carregarHistorico();
  }

  Future<void> _carregarHistorico() async {
    final historico = await HistoricoService.listar();
    setState(() {
      _treinos = historico;
    });
  }

  Widget _buildTreinoCard(Map<String, dynamic> treino, int index) {
    return ExpansionTile(
      title: Text('Treino #${_treinos.length - index}'),
      children: treino.entries.map((entry) {
        return ListTile(
          title: Text(
            entry.key[0].toUpperCase() + entry.key.substring(1),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(entry.value),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Treinos'),
      ),
      body: _treinos.isEmpty
          ? const Center(child: Text('Nenhum treino salvo ainda.'))
          : ListView.builder(
              itemCount: _treinos.length,
              itemBuilder: (context, index) {
                final treino = _treinos[index];
                return _buildTreinoCard(treino, index);
              },
            ),
    );
  }
}
