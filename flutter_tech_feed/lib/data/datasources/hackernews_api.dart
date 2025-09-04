import 'package:flutter_tech_feed/core/network/http_client.dart';
import 'package:flutter_tech_feed/data/models/article_model.dart';
import 'package:flutter_tech_feed/domain/entities/article.dart';

class HackerNewsApi {
  HackerNewsApi(this._client);
  final AppHttpClient _client;

  Future<List<ArticleModel>> fetch({required int page, required int pageSize, String? query}) async {
    // Algolia API used by HN
    final uri = Uri.https('hn.algolia.com', '/api/v1/search_by_date', {
      'tags': 'story',
      'page': '${page - 1}',
      'hitsPerPage': '$pageSize',
      if (query != null && query.isNotEmpty) 'query': query,
    });
    final data = await _client.getJson(uri) as Map<String, dynamic>;
    final hits = (data['hits'] as List<dynamic>?) ?? <dynamic>[];
    return hits.map((e) {
      final id = (e['objectID'] ?? '').toString();
      final title = (e['title'] ?? e['story_title'] ?? '').toString();
      final url = (e['url'] ?? e['story_url'] ?? '') as String;
      final excerpt = (e['story_text'] ?? e['comment_text'] ?? '')?.toString() ?? '';
      final date = DateTime.tryParse((e['created_at'] ?? '') as String)?.toLocal() ?? DateTime.now();
      return ArticleModel(
        id: 'hn_$id',
        source: FeedSource.hackerNews,
        title: title,
        excerpt: excerpt,
        url: url,
        imageUrl: null,
        publishedAt: date,
        readMinutes: null,
      );
    }).toList();
  }
}

