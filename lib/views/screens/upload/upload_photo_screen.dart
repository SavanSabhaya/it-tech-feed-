import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/routes/app_routes.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  XFile? _picked;

  Future<void> _pick(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source);
    if (file != null) {
      setState(() => _picked = file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Photo')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: _picked == null
                    ? const Text('No photo selected')
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(_picked!.path, height: 240, errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 120)),
                          const SizedBox(height: 8),
                          Text(_picked!.name),
                        ],
                      ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _pick(ImageSource.camera),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Camera'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _pick(ImageSource.gallery),
                    icon: const Icon(Icons.photo),
                    label: const Text('Gallery'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _picked == null ? null : () => Navigator.pushNamed(context, AppRoutes.cropPhoto, arguments: _picked),
              child: const Text('Upload Your Photo'),
            )
          ],
        ),
      ),
    );
  }
}
