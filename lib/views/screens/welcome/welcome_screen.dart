import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            const Text('Ready to Try On?', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            const Text('Upload your portrait and try clothes instantly.'),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
