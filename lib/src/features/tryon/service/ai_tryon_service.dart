import 'dart:io';

class AiTryOnService {
  Future<File> generateTryOn({required File portrait, required List<File> garments}) async {
    // TODO: integrate real AI model/API. For now, return the input portrait.
    return portrait;
  }
}
