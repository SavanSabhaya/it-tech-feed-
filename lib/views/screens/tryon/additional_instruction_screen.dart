import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';

class AdditionalInstructionScreen extends StatefulWidget {
  const AdditionalInstructionScreen({super.key});

  @override
  State<AdditionalInstructionScreen> createState() => _AdditionalInstructionScreenState();
}

class _AdditionalInstructionScreenState extends State<AdditionalInstructionScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Additional Instruction')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Add the additional instruction'),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(hintText: 'e.g., Make sleeves shorter, change color to navy'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.finalLook, arguments: _controller.text),
              child: const Text('Add Instruction'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.finalLook),
              child: const Text('Skip'),
            ),
          ],
        ),
      ),
    );
  }
}
