import 'package:flutter/material.dart';

class Ex1 extends StatelessWidget {
  const Ex1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        "title": "Chennai\nFlower Market",
        "image": "https://images.unsplash.com/photo-1524492449090-1b7c8e6a7c1d"
      },
      {
        "title": "Tanjore\nBronze Works",
        "image": "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee"
      },
      {
        "title": "Tanjore\nMarket",
        "image": "https://images.unsplash.com/photo-1516684669134-de6f7c473a2a"
      },
      {
        "title": "Tanjore\nThanjavur Temple",
        "image": "https://images.unsplash.com/photo-1582719471384-894fbb16e074"
      },
      {
        "title": "Temple",
        "image": "https://images.unsplash.com/photo-1593642632823-8f785ba67e45"
      },
      {
        "title": "Pondicherry\nSalt Farm",
        "image": "https://images.unsplash.com/photo-1507525428034-b723cf961d3e"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("GridView Example")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final item = items[index];

            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  // IMAGEM
                  Positioned.fill(
                    child: Image.network(
                      item["image"]!,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // OVERLAY ESCURO
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),

                  // TEXTO
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Text(
                      item["title"]!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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