import 'package:flutter/material.dart';
import '../../tryon/model/garment.dart';

class OnboardingController extends ChangeNotifier {
  final List<Garment> available = const [
    Garment(id: 'dress', name: 'Dress', icon: 'assets/icons/dress.png'),
    Garment(id: 'glasses', name: 'Glasses', icon: 'assets/icons/glasses.png'),
    Garment(id: 'hat', name: 'Hat', icon: 'assets/icons/hat.png'),
    Garment(id: 'bag', name: 'Bag', icon: 'assets/icons/bag.png'),
  ];

  final Set<String> selectedIds = {'dress', 'glasses', 'hat'};

  void toggle(String id) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }
}
