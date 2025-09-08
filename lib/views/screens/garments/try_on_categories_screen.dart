import 'package:flutter/material.dart';

class TryOnCategoriesScreen extends StatelessWidget {
  const TryOnCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'T-Shirts', 'Shirts', 'Dresses', 'Blazers', 'Jackets', 'Accessories', 'Saree', 'Hoodies'
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Try-On Categories')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemCount: categories.length,
        itemBuilder: (_, i) => Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E1F3D),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(child: Text(categories[i], textAlign: TextAlign.center)),
        ),
      ),
    );
  }
}
