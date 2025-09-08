# Virtual Try-On (Flutter + Firebase)

This repository contains a Flutter application scaffold following Provider + MVC, Navigator routing, and Firebase-ready configuration. It matches the provided UI mocks with placeholder screens.

## Getting Started

1. Install Flutter 3.22+ and Dart 3.4+.
2. Run `flutter pub get`.
3. Add Firebase using `flutterfire configure` and place generated files in `lib/firebase_options.dart` or use default options. The app guards initialization to run without configs.
4. Run the app:

```bash
flutter run
```

## Structure

- `lib/core/` theme and routing
- `lib/views/` MVC views (screens)
- `lib/controllers/` business logic controllers
- `lib/services/` Firebase and AI service facades
- `lib/models/` app data models
- `lib/providers/` Provider state

You can replace `AiTryOnService` with your model endpoint (e.g., Gemini-based or custom inference) and implement persistence in `FirebaseService`.
# it-tech-feed-