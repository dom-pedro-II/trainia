import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_data.dart';
import '../widgets/custom_nav_bar.dart';
import 'athletic_data_screen.dart';

class PersonalDataScreen extends StatefulWidget {
  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserData>(context, listen: false);
    _nameController.text = user.name;
    _ageController.text = user.age > 0 ? user.age.toString() : '';
    _heightController.text = user.height > 0 ? user.height.toString() : '';
    _weightController.text = user.weight > 0 ? user.weight.toString() : '';
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Dados Pessoais")),
      bottomNavigationBar: CustomNavBar(currentIndex: 0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Nome"),
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: "Idade"),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _heightController,
                decoration: InputDecoration(labelText: "Altura (m)"),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _weightController,
                decoration: InputDecoration(labelText: "Peso (kg)"),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () {
                  user.updatePersonalData(
                    _nameController.text,
                    int.tryParse(_ageController.text) ?? 0,
                    double.tryParse(_heightController.text) ?? 0,
                    double.tryParse(_weightController.text) ?? 0,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AthleticDataScreen()),
                  );
                },
                child: Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
