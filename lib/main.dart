import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/routes/route_generator.dart';
import 'core/theme/app_theme.dart';
import 'providers/app_provider.dart';

// Firebase imports are included but initialization is guarded to allow running without configs.
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (_) {
    // Allow app to run without Firebase config in this environment.
  }
  runApp(const VirtualTryOnApp());
}

class VirtualTryOnApp extends StatelessWidget {
  const VirtualTryOnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp(
        title: 'Virtual Try-On',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.buildTheme(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
