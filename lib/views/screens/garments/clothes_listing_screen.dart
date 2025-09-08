import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';

class ClothesListingScreen extends StatelessWidget {
  const ClothesListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Shirt')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.6,
        ),
        itemCount: 8,
        itemBuilder: (_, i) => InkWell(
          onTap: () => Navigator.pushNamed(context, AppRoutes.additionalInstruction),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1E1F3D),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(child: Icon(Icons.checkroom)),
          ),
        ),
      ),
    );
  }
}
