import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../views/screens/splash_screen.dart';
import '../../views/screens/welcome/welcome_screen.dart';
import '../../views/screens/home/home_screen.dart';
import '../../views/screens/upload/upload_photo_screen.dart';
import '../../views/screens/upload/photo_selection_screen.dart';
import '../../views/screens/upload/crop_photo_screen.dart';
import '../../views/screens/garments/clothes_listing_screen.dart';
import '../../views/screens/garments/try_on_categories_screen.dart';
import '../../views/screens/tryon/additional_instruction_screen.dart';
import '../../views/screens/tryon/final_look_screen.dart';
import '../../views/screens/history/history_screen.dart';
import '../../views/screens/favorites/favorites_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _build(const SplashScreen());
      case AppRoutes.welcome:
        return _build(const WelcomeScreen());
      case AppRoutes.home:
        return _build(const HomeScreen());
      case AppRoutes.uploadPhoto:
        return _build(const UploadPhotoScreen());
      case AppRoutes.photoSelection:
        return _build(const PhotoSelectionScreen());
      case AppRoutes.cropPhoto:
        return _build(const CropPhotoScreen());
      case AppRoutes.clothesListing:
        return _build(const ClothesListingScreen());
      case AppRoutes.tryOnCategories:
        return _build(const TryOnCategoriesScreen());
      case AppRoutes.additionalInstruction:
        return _build(const AdditionalInstructionScreen());
      case AppRoutes.finalLook:
        return _build(const FinalLookScreen());
      case AppRoutes.history:
        return _build(const HistoryScreen());
      case AppRoutes.favorites:
        return _build(const FavoritesScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Route not found: ${settings.name}')),
          ),
        );
    }
  }

  static MaterialPageRoute _build(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
