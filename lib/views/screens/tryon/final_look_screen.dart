import 'package:flutter/material.dart';

class FinalLookScreen extends StatelessWidget {
  const FinalLookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final instruction = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(title: const Text('Your Look')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1F3D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(child: Icon(Icons.person, size: 140)),
              ),
            ),
            const SizedBox(height: 16),
            if (instruction != null && instruction.isNotEmpty)
              Text('Instruction: $instruction', textAlign: TextAlign.center),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.save_alt), label: const Text('Save')),
                ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.refresh), label: const Text('Re-generate')),
                ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.share), label: const Text('Share')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
