import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user_data.dart';
import 'screens/personal_data_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserData(),
      child: MaterialApp(title: 'Cadastro Atleta', home: PersonalDataScreen()),
    );
  }
}
