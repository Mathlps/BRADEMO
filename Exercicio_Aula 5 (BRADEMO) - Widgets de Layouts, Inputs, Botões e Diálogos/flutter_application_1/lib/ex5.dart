import 'package:flutter/material.dart';

class Ex5 extends StatefulWidget {
  const Ex5({super.key});

  @override
  State<Ex5> createState() => _Ex5State();
}

class _Ex5State extends State<Ex5> {
  int _selectedIndex = 0;
  bool _showOptions = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleFab() {
    setState(() {
      _showOptions = !_showOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomAppBar with FAB'),
      ),

      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Text(
              'TAB: ${_selectedIndex + 1}',
              style: const TextStyle(fontSize: 24),
            ),
          ),

          // BOTÕES QUE APARECEM
          if (_showOptions)
            Positioned(
              bottom: 120,
              child: Column(
                children: const [
                  FloatingActionButton(
                    mini: true,
                    onPressed: null,
                    child: Icon(Icons.message),
                  ),
                  SizedBox(height: 10),
                  FloatingActionButton(
                    mini: true,
                    onPressed: null,
                    child: Icon(Icons.email),
                  ),
                  SizedBox(height: 10),
                  FloatingActionButton(
                    mini: true,
                    onPressed: null,
                    child: Icon(Icons.phone),
                  ),
                ],
              ),
            ),
        ],
      ),

      // FAB PRINCIPAL
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleFab,
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // BARRA INFERIOR
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: const Icon(Icons.layers),
              onPressed: () => _onItemTapped(1),
            ),

            const SizedBox(width: 40), // espaço do FAB

            IconButton(
              icon: const Icon(Icons.dashboard),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}