import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/onboarding/controller/onboarding_controller.dart';

class VirtualTryOnApp extends StatelessWidget {
  const VirtualTryOnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Virtual Try-On',
        theme: AppTheme.buildTheme(),
        initialRoute: AppRouter.onboarding,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
