import 'package:flutter_tech_feed/data/datasources/devto_api.dart';
import 'package:flutter_tech_feed/data/datasources/hackernews_api.dart';
import 'package:flutter_tech_feed/data/datasources/techcrunch_rss.dart';
import 'package:flutter_tech_feed/domain/entities/article.dart';
import 'package:flutter_tech_feed/domain/repositories/feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  FeedRepositoryImpl({
    required DevtoApi devtoApi,
    required HackerNewsApi hackerNewsApi,
    required TechCrunchRss techCrunchRss,
  })  : _devto = devtoApi,
        _hn = hackerNewsApi,
        _tc = techCrunchRss;

  final DevtoApi _devto;
  final HackerNewsApi _hn;
  final TechCrunchRss _tc;

  @override
  Future<List<ArticleEntity>> fetchArticles({
    required FeedSource source,
    required int page,
    required int pageSize,
    String? query,
  }) async {
    switch (source) {
      case FeedSource.devto:
        return _devto.fetch(page: page, pageSize: pageSize, query: query);
      case FeedSource.hackerNews:
        return _hn.fetch(page: page, pageSize: pageSize, query: query);
      case FeedSource.techCrunch:
      case FeedSource.news:
        return _tc.fetch(page: page, pageSize: pageSize, query: query);
      case FeedSource.all:
        final results = await Future.wait([
          _tc.fetch(page: page, pageSize: pageSize, query: query),
          _devto.fetch(page: page, pageSize: pageSize, query: query),
          _hn.fetch(page: page, pageSize: pageSize, query: query),
        ]);
        return results.expand((e) => e).toList()
          ..sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
    }
  }
}

