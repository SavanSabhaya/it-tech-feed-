import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Try-On History')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, i) => ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text('Look #${i + 1}'),
          subtitle: const Text('Saved • 4K'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: 10,
      ),
    );
  }
}
