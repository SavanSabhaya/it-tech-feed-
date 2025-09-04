import 'package:flutter_tech_feed/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    required super.id,
    required super.source,
    required super.title,
    required super.excerpt,
    required super.url,
    required super.imageUrl,
    required super.publishedAt,
    required super.readMinutes,
  });

  ArticleEntity toEntity() => this;
}

