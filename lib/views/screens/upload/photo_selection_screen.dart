import 'package:flutter/material.dart';

class PhotoSelectionScreen extends StatelessWidget {
  const PhotoSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Photo')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (_, i) => Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E1F3D),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.person),
        ),
      ),
    );
  }
}
