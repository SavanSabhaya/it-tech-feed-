import '../services/ai_tryon_service.dart';

class TryOnController {
  final AiTryOnService aiService;
  TryOnController({required this.aiService});

  Future<String> createLook({required String userPhotoUrl, required String garmentImageUrl, String? prompt}) async {
    return aiService.generateTryOn(userPhotoUrl: userPhotoUrl, garmentImageUrl: garmentImageUrl, prompt: prompt);
  }
}
