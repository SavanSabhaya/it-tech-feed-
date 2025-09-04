class ArticleEntity {
  const ArticleEntity({
    required this.id,
    required this.source,
    required this.title,
    required this.excerpt,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.readMinutes,
  });

  final String id;
  final FeedSource source;
  final String title;
  final String excerpt;
  final String url;
  final String? imageUrl;
  final DateTime publishedAt;
  final int? readMinutes;
}

enum FeedSource { all, news, devto, hackerNews, techCrunch }

