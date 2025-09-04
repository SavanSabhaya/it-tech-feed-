import 'package:flutter_tech_feed/domain/entities/article.dart';
import 'package:flutter_tech_feed/domain/repositories/feed_repository.dart';

class GetFeedUseCase {
  const GetFeedUseCase(this._repository);

  final FeedRepository _repository;

  Future<List<ArticleEntity>> call({
    required FeedSource source,
    required int page,
    required int pageSize,
    String? query,
  }) {
    return _repository.fetchArticles(
      source: source,
      page: page,
      pageSize: pageSize,
      query: query,
    );
  }
}

