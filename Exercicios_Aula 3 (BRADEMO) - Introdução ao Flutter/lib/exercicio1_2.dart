import 'package:flutter/material.dart';

class Exercicio1_2 extends StatelessWidget {
  const Exercicio1_2({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child:Container(
            margin: EdgeInsets.symmetric(vertical:100.0, horizontal: 120.0),
            height: 100.0,
            width: 100.0,
            color: Colors.deepOrange,
            child: Text('Hi Mom 🐣'),
          ), 
        ),

        bottomNavigationBar: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.phone, color: Colors.deepPurpleAccent),
                  Text("call", style: TextStyle(color: Colors.deepPurpleAccent)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.airplanemode_active_outlined,
                    color: Colors.deepPurpleAccent,
                  ),
                  Text("route", style: TextStyle(color: Colors.deepPurpleAccent)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.share, color: Colors.deepPurpleAccent),
                  Text("share", style: TextStyle(color: Colors.deepPurpleAccent)),
                ],
              ),
            ],
          ),
        ),
        ),
    );
    
  
  }

}
