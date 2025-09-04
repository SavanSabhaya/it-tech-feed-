import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_feed/core/utils/datetime.dart';
import 'package:flutter_tech_feed/domain/entities/article.dart';
import 'package:flutter_tech_feed/presentation/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final atBottom = _controller.position.pixels >= _controller.position.maxScrollExtent - 200;
      if (atBottom) ref.read(feedNotifierProvider.notifier).loadMore();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(feedNotifierProvider);
    final notifier = ref.read(feedNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tech Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.refresh(),
          ),
        ],
      ),
      floatingActionButton: _controller.hasClients && _controller.offset > 400
          ? FloatingActionButton(
              onPressed: () => _controller.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut),
              child: const Icon(Icons.arrow_upward),
            )
          : null,
      body: Column(
        children: [
          _ChipsBar(
            selected: state.source,
            onSelected: notifier.setSource,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search'),
              onSubmitted: notifier.setQuery,
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => notifier.refresh(),
              child: ListView.builder(
                controller: _controller,
                itemCount: state.articles.length + (state.isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= state.articles.length) {
                    return const Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final a = state.articles[index];
                  return _ArticleCard(article: a as ArticleEntity);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChipsBar extends StatelessWidget {
  const _ChipsBar({required this.selected, required this.onSelected});
  final FeedSource selected;
  final void Function(FeedSource) onSelected;

  @override
  Widget build(BuildContext context) {
    final entries = <FeedSource, String>{
      FeedSource.all: 'All',
      FeedSource.news: 'News',
      FeedSource.devto: 'Dev.to',
      FeedSource.hackerNews: 'Hacker News',
    };
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: entries.entries
            .map((e) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(e.value),
                    selected: selected == e.key,
                    onSelected: (_) => onSelected(e.key),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  const _ArticleCard({required this.article});
  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(article.url), mode: LaunchMode.externalApplication),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.imageUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(article.imageUrl!, height: 160, width: double.infinity, fit: BoxFit.cover),
                ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _SourcePill(source: article.source),
                  const SizedBox(width: 8),
                  if (article.readMinutes != null)
                    Text(formatReadMinutes(article.readMinutes), style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              const SizedBox(height: 8),
              Text(article.title, style: Theme.of(context).textTheme.titleMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 6),
              Text(article.excerpt, maxLines: 3, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(timeAgo(article.publishedAt), style: Theme.of(context).textTheme.bodySmall),
                  const Spacer(),
                  IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.share), onPressed: () => launchUrl(Uri.parse(article.url))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SourcePill extends StatelessWidget {
  const _SourcePill({required this.source});
  final FeedSource source;
  @override
  Widget build(BuildContext context) {
    final text = switch (source) {
      FeedSource.devto => 'Dev.to',
      FeedSource.hackerNews => 'HackerNews',
      FeedSource.techCrunch => 'TechCrunch',
      FeedSource.news => 'News',
      FeedSource.all => 'All',
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(text, style: Theme.of(context).textTheme.labelSmall),
    );
  }
}

