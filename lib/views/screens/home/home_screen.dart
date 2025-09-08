import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';

class HomeAction {
  final String title;
  final IconData icon;
  final String route;
  HomeAction(this.title, this.icon, this.route);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      HomeAction('Upload Photo', Icons.upload, AppRoutes.uploadPhoto),
      HomeAction('Try Clothing', Icons.checkroom, AppRoutes.clothesListing),
      HomeAction('Categories', Icons.dashboard, AppRoutes.tryOnCategories),
      HomeAction('Favorites', Icons.favorite, AppRoutes.favorites),
      HomeAction('History', Icons.history, AppRoutes.history),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
        ),
        itemCount: actions.length,
        itemBuilder: (context, index) {
          final a = actions[index];
          return InkWell(
            onTap: () => Navigator.pushNamed(context, a.route),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1F3D),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(a.icon, size: 40),
                  const SizedBox(height: 12),
                  Text(a.title),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
