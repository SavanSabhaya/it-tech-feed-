import 'package:flutter_tech_feed/domain/entities/article.dart';

abstract class FeedRepository {
  Future<List<ArticleEntity>> fetchArticles({
    required FeedSource source,
    required int page,
    required int pageSize,
    String? query,
  });
}

