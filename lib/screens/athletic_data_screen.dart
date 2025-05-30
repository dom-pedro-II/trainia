import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_data.dart';
import '../widgets/custom_nav_bar.dart';
import 'summary_screen.dart';

class AthleticDataScreen extends StatefulWidget {
  @override
  _AthleticDataScreenState createState() => _AthleticDataScreenState();
}

class _AthleticDataScreenState extends State<AthleticDataScreen> {
  String _level = 'Iniciante';
  String _modality = 'Ciclismo';
  String _goal = 'Performance';
  final List<String> _days = [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
    'Domingo',
  ];
  Map<String, double> _dailyHours = {};

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserData>(context, listen: false);
    _level = user.activityLevel.isNotEmpty ? user.activityLevel : 'Iniciante';
    _modality = user.modality.isNotEmpty ? user.modality : 'Ciclismo';
    _goal = user.goal.isNotEmpty ? user.goal : 'Performance';
    _dailyHours = Map.from(user.dailyTrainingHours);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Dados Atléticos")),
      bottomNavigationBar: CustomNavBar(currentIndex: 1),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            DropdownButtonFormField<String>(
              value: _level,
              items: [
                'Iniciante',
                'Intermediário',
                'Avançado',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => _level = val!),
              decoration: InputDecoration(labelText: "Nível de Atividade"),
            ),
            DropdownButtonFormField<String>(
              value: _modality,
              items: [
                'Ciclismo',
                'MTB',
                'Corrida a pé',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => _modality = val!),
              decoration: InputDecoration(labelText: "Modalidade"),
            ),
            DropdownButtonFormField<String>(
              value: _goal,
              items: [
                'Performance',
                'resistência',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => _goal = val!),
              decoration: InputDecoration(labelText: "Objetivo"),
            ),
            Divider(),
            Text("Horas disponíveis por dia:"),
            ..._days.map(
              (day) => Row(
                children: [
                  Expanded(child: Text(day)),
                  Expanded(
                    child: DropdownButton<double>(
                      value: _dailyHours[day],
                      items: [
                        0.0,
                        1.0,
                        1.5,
                        2.0,
                        2.5,
                        3.0,
                        3.5,
                        4.0,
                        4.5,
                        5.0,
                        5.5,
                        6.0,
                        6.5,
                        7.0,
                      ]
                          .map(
                            (h) => DropdownMenuItem<double>(
                              value: h,
                              child: Text(
                                h == 0.0 ? 'Indisponível' : '${h}h',
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) =>
                          setState(() => _dailyHours[day] = val!),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                user.updateAthleticData(_level, _modality, _goal, _dailyHours);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SummaryScreen()),
                );
              },
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
