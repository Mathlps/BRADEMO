import 'package:flutter/material.dart';


class Exercicio3 extends StatelessWidget {
  const Exercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 220,
              height: 220,
              child: Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'Green',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      width: 150,
                      height: 150,
                      color: const Color.fromARGB(255, 96, 84, 83),
                      child: const Center(
                        child: Text(
                          'Red',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 40,
                    top: 40,
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.purple,
                      child: const Center(
                        child: Text(
                          'Purple',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}