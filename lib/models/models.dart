class UserPhoto {
  final String id;
  final String url;
  final DateTime createdAt;
  UserPhoto({required this.id, required this.url, required this.createdAt});
}

class GarmentCategory {
  final String id;
  final String name;
  final String? iconUrl;
  GarmentCategory({required this.id, required this.name, this.iconUrl});
}

class GarmentItem {
  final String id;
  final String name;
  final String imageUrl;
  final String categoryId;
  GarmentItem({required this.id, required this.name, required this.imageUrl, required this.categoryId});
}

class LookResult {
  final String id;
  final String userPhotoUrl;
  final String garmentImageUrl;
  final String resultImageUrl;
  final bool favorite;
  final DateTime createdAt;
  LookResult({
    required this.id,
    required this.userPhotoUrl,
    required this.garmentImageUrl,
    required this.resultImageUrl,
    required this.favorite,
    required this.createdAt,
  });
}
