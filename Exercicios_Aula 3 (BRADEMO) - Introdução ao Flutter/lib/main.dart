import 'package:flutter/material.dart';
import 'exercicio5.dart';
import 'exercicio4.dart';
import 'exercicio1_2.dart';
import 'exercicio3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Exercicio4(), // TROCA AQUI
    );
  }
}