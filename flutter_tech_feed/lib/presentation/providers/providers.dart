import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_feed/core/network/http_client.dart';
import 'package:flutter_tech_feed/data/datasources/devto_api.dart';
import 'package:flutter_tech_feed/data/datasources/hackernews_api.dart';
import 'package:flutter_tech_feed/data/datasources/techcrunch_rss.dart';
import 'package:flutter_tech_feed/data/repositories/feed_repository_impl.dart';
import 'package:flutter_tech_feed/domain/entities/article.dart';
import 'package:flutter_tech_feed/domain/usecases/get_feed.dart';

// Core
final httpClientProvider = Provider<AppHttpClient>((ref) => const AppHttpClient());

// Data sources
final devtoProvider = Provider<DevtoApi>((ref) => DevtoApi(ref.read(httpClientProvider)));
final hackerNewsProvider = Provider<HackerNewsApi>((ref) => HackerNewsApi(ref.read(httpClientProvider)));
final techCrunchProvider = Provider<TechCrunchRss>((ref) => TechCrunchRss(ref.read(httpClientProvider)));

// Repository
final feedRepositoryProvider = Provider<FeedRepositoryImpl>((ref) => FeedRepositoryImpl(
      devtoApi: ref.read(devtoProvider),
      hackerNewsApi: ref.read(hackerNewsProvider),
      techCrunchRss: ref.read(techCrunchProvider),
    ));

// Use cases
final getFeedProvider = Provider<GetFeedUseCase>((ref) => GetFeedUseCase(ref.read(feedRepositoryProvider)));

// UI state
class FeedState {
  const FeedState({
    required this.source,
    required this.articles,
    required this.isLoading,
    required this.page,
    required this.query,
    required this.hasMore,
  });

  final FeedSource source;
  final List<dynamic> articles; // ArticleEntity
  final bool isLoading;
  final int page;
  final String query;
  final bool hasMore;

  FeedState copyWith({
    FeedSource? source,
    List<dynamic>? articles,
    bool? isLoading,
    int? page,
    String? query,
    bool? hasMore,
  }) => FeedState(
        source: source ?? this.source,
        articles: articles ?? this.articles,
        isLoading: isLoading ?? this.isLoading,
        page: page ?? this.page,
        query: query ?? this.query,
        hasMore: hasMore ?? this.hasMore,
      );

  static FeedState initial() => const FeedState(
        source: FeedSource.all,
        articles: <dynamic>[],
        isLoading: false,
        page: 1,
        query: '',
        hasMore: true,
      );
}

class FeedNotifier extends StateNotifier<FeedState> {
  FeedNotifier(this._getFeed) : super(FeedState.initial()) {
    refresh();
  }

  final GetFeedUseCase _getFeed;

  Future<void> refresh() async {
    state = state.copyWith(isLoading: true, page: 1, hasMore: true, articles: <dynamic>[]);
    final articles = await _getFeed(source: state.source, page: 1, pageSize: 20, query: state.query);
    state = state.copyWith(isLoading: false, articles: articles, page: 1, hasMore: articles.length == 20);
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;
    state = state.copyWith(isLoading: true);
    final nextPage = state.page + 1;
    final more = await _getFeed(source: state.source, page: nextPage, pageSize: 20, query: state.query);
    state = state.copyWith(
      isLoading: false,
      page: nextPage,
      hasMore: more.length == 20,
      articles: List.of(state.articles)..addAll(more),
    );
  }

  void setSource(FeedSource source) {
    state = state.copyWith(source: source);
    refresh();
  }

  void setQuery(String query) {
    state = state.copyWith(query: query);
    refresh();
  }
}

final feedNotifierProvider = StateNotifierProvider<FeedNotifier, FeedState>((ref) => FeedNotifier(ref.read(getFeedProvider)));

