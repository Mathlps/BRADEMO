import 'package:flutter/material.dart';

class Ex3 extends StatelessWidget {
  const Ex3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ex2')),
      body: Column(
        children: [
         
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '1. Filho respeita o tamanho do pai',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              height: 150,
              color: Colors.blue[100],
              child: Container(
                width: 200,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),

          const SizedBox(height: 20),

          
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '2. Ocupando todo espaço disponível',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 100,
            color: Colors.green[100],
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.green,
            ),
          ),

          const SizedBox(height: 20),

          
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '3. Expanded divide o espaço',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(color: Colors.red),
                ),
                Expanded(
                  child: Container(color: Colors.orange),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}