import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contador extends ChangeNotifier {

  int valor = 0;

  void incrementar() {
    valor++;
    notifyListeners();
  }

  void decrementar() {
    valor--;
    notifyListeners();
  }
}

class Ex2 extends StatelessWidget {
  const Ex2({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => Contador(),

      child: Scaffold(
        backgroundColor: Colors.black,

        body: Consumer<Contador>(
          builder: (context, contador, child) {

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Text(
                    "${contador.valor}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
                      contador.incrementar();
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(220, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),

                    child: const Text("Incrementar"),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      contador.decrementar();
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(220, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),

                    child: const Text("Decrementar"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}