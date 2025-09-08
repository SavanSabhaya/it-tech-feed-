import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemCount: 6,
        itemBuilder: (_, i) => Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E1F3D),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(child: Icon(Icons.favorite)),
        ),
      ),
    );
  }
}
