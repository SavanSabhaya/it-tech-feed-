import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';

class CropPhotoScreen extends StatelessWidget {
  const CropPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crop Photo')),
      body: Column(
        children: [
          const Expanded(
            child: Center(child: Icon(Icons.crop, size: 120)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.additionalInstruction),
              child: const Text('Crop Photo'),
            ),
          )
        ],
      ),
    );
  }
}
