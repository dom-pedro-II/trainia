import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = {
    'username': TextEditingController(),
    'name': TextEditingController(),
    'password': TextEditingController(),
    'age': TextEditingController(),
    'height': TextEditingController(),
    'weight': TextEditingController(),
    'activity': TextEditingController(),
    'modality': TextEditingController(),
  };

  String? _erro;

  Future<void> _cadastrar() async {
    if (!_formKey.currentState!.validate()) return;

    final sucesso = await AuthService.cadastrar(
      username: _controllers['username']!.text,
      name: _controllers['name']!.text,
      password: _controllers['password']!.text,
      age: int.parse(_controllers['age']!.text),
      height: double.parse(_controllers['height']!.text),
      weight: double.parse(_controllers['weight']!.text),
      activityLevel: _controllers['activity']!.text,
      sportsModality: _controllers['modality']!.text,
    );

    if (sucesso) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      setState(() => _erro = 'Erro ao cadastrar usuário.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              for (var entry in _controllers.entries)
                TextFormField(
                  controller: entry.value,
                  decoration: InputDecoration(labelText: entry.key),
                  obscureText: entry.key == 'password',
                  validator: (v) => v!.isEmpty ? 'Preencha o campo' : null,
                ),
              const SizedBox(height: 16),
              if (_erro != null) Text(_erro!, style: const TextStyle(color: Colors.red)),
              ElevatedButton(
                onPressed: _cadastrar,
                child: const Text('Cadastrar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}