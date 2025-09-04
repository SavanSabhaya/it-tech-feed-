import 'package:flutter_tech_feed/core/network/http_client.dart';
import 'package:flutter_tech_feed/data/models/article_model.dart';
import 'package:flutter_tech_feed/domain/entities/article.dart';
import 'package:xml/xml.dart';

class TechCrunchRss {
  TechCrunchRss(this._client);
  final AppHttpClient _client;

  Future<List<ArticleModel>> fetch({required int page, required int pageSize, String? query}) async {
    // TechCrunch RSS does not support pagination; we'll fetch and slice.
    final uri = Uri.parse('https://techcrunch.com/feed/');
    final xmlString = await _client.getText(uri);
    final document = XmlDocument.parse(xmlString);
    final items = document.findAllElements('item').toList();
    final start = (page - 1) * pageSize;
    final sliced = items.skip(start).take(pageSize);
    return sliced.map((item) {
      final title = item.getElement('title')?.innerText.trim() ?? '';
      final link = item.getElement('link')?.innerText.trim() ?? '';
      final desc = item.getElement('description')?.innerText.trim() ?? '';
      final pubDate = item.getElement('pubDate')?.innerText.trim() ?? '';
      final date = DateTime.tryParse(pubDate) ?? DateTime.now();
      return ArticleModel(
        id: 'tc_${link.hashCode}',
        source: FeedSource.techCrunch,
        title: title,
        excerpt: desc.replaceAll(RegExp(r'<[^>]*>'), ''),
        url: link,
        imageUrl: null,
        publishedAt: date.toLocal(),
        readMinutes: null,
      );
    }).where((a) => query == null || query.isEmpty || a.title.toLowerCase().contains(query.toLowerCase())).toList();
  }
}

