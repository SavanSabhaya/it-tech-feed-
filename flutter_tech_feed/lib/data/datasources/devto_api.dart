import 'dart:math';
import 'package:flutter_tech_feed/core/network/http_client.dart';
import 'package:flutter_tech_feed/data/models/article_model.dart';
import 'package:flutter_tech_feed/domain/entities/article.dart';

class DevtoApi {
  DevtoApi(this._client);
  final AppHttpClient _client;

  Future<List<ArticleModel>> fetch({required int page, required int pageSize, String? query}) async {
    final uri = Uri.https('dev.to', '/api/articles', {
      'page': '$page',
      'per_page': '$pageSize',
      if (query != null && query.isNotEmpty) 'tag': query,
    });
    final data = await _client.getJson(uri) as List<dynamic>;
    return data.map((e) {
      final id = (e['id'] ?? e['url']).toString();
      final title = (e['title'] ?? '').toString();
      final description = (e['description'] ?? '').toString();
      final coverImage = (e['cover_image'] ?? e['social_image']) as String?;
      final url = (e['url'] ?? '') as String;
      final published = DateTime.tryParse((e['published_at'] ?? '') as String) ?? DateTime.now();
      final readingTime = (e['reading_time_minutes'] as num?)?.toInt() ?? max(1, title.split(' ').length ~/ 200);
      return ArticleModel(
        id: 'devto_$id',
        source: FeedSource.devto,
        title: title,
        excerpt: description,
        url: url,
        imageUrl: coverImage,
        publishedAt: published.toLocal(),
        readMinutes: readingTime,
      );
    }).toList();
  }
}

