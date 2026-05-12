import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class TarefaProvider extends ChangeNotifier {

  final Box box = Hive.box('tarefasBox');

  List<String> tarefas = [];

  // Construtor
  TarefaProvider() {
    carregarTarefas();
  }

  void carregarTarefas() {

    tarefas = List<String>.from(
      box.get('lista', defaultValue: []),
    );

    notifyListeners();
  }

  void adicionarTarefa(String tarefa) {

    tarefas.add(tarefa);

    box.put('lista', tarefas);

    notifyListeners();
  }

  void removerTarefa(int index) {

    tarefas.removeAt(index);

    box.put('lista', tarefas);

    notifyListeners();
  }
}

class Ex3 extends StatelessWidget {
  const Ex3({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController controller = TextEditingController();

    return ChangeNotifierProvider(
      create: (context) => TarefaProvider(),

      child: Scaffold(
        backgroundColor: Colors.black,

        appBar: AppBar(
          title: const Text("Lista de Tarefas"),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),

        body: Consumer<TarefaProvider>(
          builder: (context, provider, child) {

            return Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(20),

                  child: Row(
                    children: [

                      Expanded(
                        child: TextField(
                          controller: controller,

                          style: const TextStyle(color: Colors.white),

                          decoration: InputDecoration(
                            hintText: "Digite uma tarefa",
                            hintStyle: const TextStyle(color: Colors.white54),

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[700]!),
                            ),

                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      ElevatedButton(
                        onPressed: () {

                          if (controller.text.isNotEmpty) {

                            provider.adicionarTarefa(controller.text);

                            controller.clear();
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),

                        child: const Text("ADD"),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: provider.tarefas.length,

                    itemBuilder: (context, index) {

                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[800]!,
                          ),
                        ),

                        child: ListTile(

                          title: Text(
                            provider.tarefas[index],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),

                          trailing: IconButton(
                            onPressed: () {
                              provider.removerTarefa(index);
                            },

                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}