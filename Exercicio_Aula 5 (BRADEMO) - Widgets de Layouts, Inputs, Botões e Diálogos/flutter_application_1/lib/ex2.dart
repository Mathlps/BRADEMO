import 'package:flutter/material.dart';

class Ex2 extends StatefulWidget {
  const Ex2({super.key});

  @override
  State<Ex2> createState() => _Ex2State();
}

class _Ex2State extends State<Ex2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isLandscape = width > 600;

    return Scaffold(
      backgroundColor: Colors.black,
      body: isLandscape 
        ? Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Cheetah Coding",
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 50),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                        ),
                        child: const Text("BUTTON 1"),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 50),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                        ),
                        child: const Text("BUTTON 2"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(width: 1, color: Colors.grey[800]),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[800]!), top: BorderSide(color: Colors.grey[800]!))),
                      child: const ListTile(title: Center(child: Text("Dart", style: TextStyle(color: Colors.white)))),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[800]!))),
                      child: const ListTile(title: Center(child: Text("JavaScript", style: TextStyle(color: Colors.white)))),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[800]!))),
                      child: const ListTile(title: Center(child: Text("PHP", style: TextStyle(color: Colors.white)))),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[800]!))),
                      child: const ListTile(title: Center(child: Text("C++", style: TextStyle(color: Colors.white)))),
                    ),
                  ],
                ),
              )
            ],
          )
        : Column(
            children: [
              const SizedBox(height: 80),
              const Text(
                "Cheetah Coding",
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(0, 50),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                        ),
                        child: const Text("BUTTON 1"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(0, 50),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                        ),
                        child: const Text("BUTTON 2"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[800]!), top: BorderSide(color: Colors.grey[800]!))),
                      child: const ListTile(title: Center(child: Text("Dart", style: TextStyle(color: Colors.white)))),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[800]!))),
                      child: const ListTile(title: Center(child: Text("JavaScript", style: TextStyle(color: Colors.white)))),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[800]!))),
                      child: const ListTile(title: Center(child: Text("PHP", style: TextStyle(color: Colors.white)))),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[800]!))),
                      child: const ListTile(title: Center(child: Text("C++", style: TextStyle(color: Colors.white)))),
                    ),
                  ],
                ),
              )
            ],
          )
    );
  }
}