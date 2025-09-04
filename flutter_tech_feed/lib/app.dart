import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/pages/home_page.dart';

class TechFeedApp extends ConsumerWidget {
  const TechFeedApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2F80ED)),
      useMaterial3: true,
      fontFamily: 'Sans',
    );
    return MaterialApp(
      title: 'Tech Feed',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomePage(),
    );
  }
}

