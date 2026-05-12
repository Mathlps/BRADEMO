import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Ex1 extends StatefulWidget {
  const Ex1({super.key});

  @override
  State<Ex1> createState() => _Ex1State();
}

class _Ex1State extends State<Ex1> {

  final Box box = Hive.box('configuracoes');

  bool modoRelax = true;

  @override
  void initState() {
    super.initState();

    // Carrega valor salvo
    modoRelax = box.get('modoRelax', defaultValue: true);
  }

  void trocarModo() {
    setState(() {
      modoRelax = !modoRelax;
    });

    // Salva no Hive
    box.put('modoRelax', modoRelax);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: modoRelax ? Colors.blue : Colors.green,

      body: Center(
        child: ElevatedButton(
          onPressed: trocarModo,

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            minimumSize: const Size(250, 60),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),

          child: Text(
            modoRelax ? "Modo Relax" : "Modo Focado",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}