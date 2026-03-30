import 'package:flutter/material.dart';
import 'exercicio1_2/ex1_2.dart';
import 'exercicio3/login.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(), //TROCAR AQUI
    );
  }
}
