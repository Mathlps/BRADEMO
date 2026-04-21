import 'package:flutter/material.dart';
import 'package:flutter_application_1/ex1.dart';
import 'package:flutter_application_1/ex2.dart';
import 'package:flutter_application_1/ex3.dart';
import 'package:flutter_application_1/ex4.dart';
import 'package:flutter_application_1/ex5.dart';
import 'package:flutter_application_1/ex6.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Ex6(), // TROCA AQUI
    );
  }
}
