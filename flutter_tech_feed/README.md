# Flutter Tech Feed

Aggregated tech news app (TechCrunch, Dev.to, Hacker News) built with Flutter and clean architecture. Mirrors the React UI shown (chips for filters, card list, search, share, back-to-top).

## Features
- Category chips: **All, News, Dev.to, Hacker News**
- Feed cards: source, read time, title, excerpt, age, actions (like/share), read more
- Search, pull-to-refresh, infinite/"load more" scroll, back-to-top FAB

## Structure
```
lib/
  app.dart
  main.dart
  core/
  domain/
  data/
  presentation/
```

## Run
Ensure Flutter SDK is installed, then:
```bash
flutter pub get
flutter run -d chrome
```

