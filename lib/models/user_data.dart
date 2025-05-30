import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String name = '';
  int age = 0;
  double height = 0;
  double weight = 0;

  String activityLevel = '';
  String modality = '';
  String goal = '';
  Map<String, double> dailyTrainingHours = {
    'Segunda': 0,
    'Terça': 0,
    'Quarta': 0,
    'Quinta': 0,
    'Sexta': 0,
    'Sábado': 0,
    'Domingo': 0,
  };

  void updatePersonalData(String n, int a, double h, double w) {
    name = n;
    age = a;
    height = h;
    weight = w;
    notifyListeners();
  }

  void updateAthleticData(
    String level,
    String mod,
    String g,
    Map<String, double> hours,
  ) {
    activityLevel = level;
    modality = mod;
    goal = g;
    dailyTrainingHours = hours;
    notifyListeners();
  }
}
