import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HTTP Requests',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String resultado = '';

  final TextEditingController idController = TextEditingController();
  final TextEditingController tituloController = TextEditingController();

  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  // GET único
  Future<void> getPost() async {
    final response = await http.get(
      Uri.parse('$baseUrl/${idController.text}'),
    );

    setState(() {
      resultado = response.body;
    });
  }

  // GET lista
  Future<void> getPosts() async {
    final response = await http.get(
      Uri.parse(baseUrl),
    );

    List dados = jsonDecode(response.body);

    setState(() {
      resultado = dados.take(5).toList().toString();
    });
  }

  // POST
  Future<void> criarPost() async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'title': tituloController.text,
        'body': 'Conteúdo teste',
        'userId': 1,
      }),
    );

    setState(() {
      resultado = response.body;
    });
  }

  // PUT
  Future<void> atualizarPost() async {
    final response = await http.put(
      Uri.parse('$baseUrl/${idController.text}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id': idController.text,
        'title': tituloController.text,
        'body': 'Post atualizado',
        'userId': 1,
      }),
    );

    setState(() {
      resultado = response.body;
    });
  }

  // DELETE
  Future<void> deletarPost() async {
    final response = await http.delete(
      Uri.parse('$baseUrl/${idController.text}'),
    );

    setState(() {
      resultado =
          'Post deletado.\nStatus Code: ${response.statusCode}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSONPlaceholder API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  labelText: 'ID do Post',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: tituloController,
                decoration: const InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: getPost,
                    child: const Text('GET'),
                  ),

                  ElevatedButton(
                    onPressed: getPosts,
                    child: const Text('GET LISTA'),
                  ),

                  ElevatedButton(
                    onPressed: criarPost,
                    child: const Text('POST'),
                  ),

                  ElevatedButton(
                    onPressed: atualizarPost,
                    child: const Text('PUT'),
                  ),

                  ElevatedButton(
                    onPressed: deletarPost,
                    child: const Text('DELETE'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.grey.shade200,
                child: Text(resultado),
              ),
            ],
          ),
        ),
      ),
    );
  }
}