import 'package:flutter/material.dart';
import '../screens/personal_data_screen.dart';
import '../screens/athletic_data_screen.dart';
import '../screens/summary_screen.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;

  CustomNavBar({required this.currentIndex});

  void _navigate(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => PersonalDataScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AthleticDataScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => SummaryScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _navigate(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Pessoal'),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_bike),
          label: 'Atlético',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pedal_bike_outlined),
          label: 'Resumo',
        ),
      ],
    );
  }
}
