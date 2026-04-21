import 'package:flutter/material.dart';

class Ex6 extends StatefulWidget {
  const Ex6({super.key});

  @override
  State<Ex6> createState() => _Ex6State();
}

class _Ex6State extends State<Ex6> {
  final List<Map<String, dynamic>> tasks = List.generate(
    5,
    (index) => {
      "title": "Task 2022-07-09",
      "time": "18:08:3${index}.000",
      "done": false,
    },
  );

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Aviso"),
        content: const Text("Você está no App de Notas de Tarefas"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _toggleTask(int index, bool? value) {
    setState(() {
      tasks[index]["done"] = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kindacode.com"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {},
            child: const Text("View Completed Tasks"),
          ),

          const SizedBox(height: 10),

          const Text("You have 5 uncompleted tasks"),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                return Card(
                  color: Colors.yellow[200],
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(task["title"]),
                    subtitle: Text(task["time"]),
                    trailing: Checkbox(
                      value: task["done"],
                      onChanged: (value) => _toggleTask(index, value),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}