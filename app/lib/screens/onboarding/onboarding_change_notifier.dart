import 'package:flutter/material.dart';

class OnboardingChangeNotifier with ChangeNotifier {
  late TabController tabController;
  int get index => tabController.index;

  void onNextPage({Function? onStart}) {
    if (index != tabController.length - 1) {
      int nextIndex = index + 1;
      tabController.animateTo(nextIndex);
      notifyListeners();
    } else {
      if (onStart != null) onStart();
    }
  }

  void onPreviousPage() {
    if (index > 0) {
      int prevIndex = index - 1;
      tabController.animateTo(prevIndex);
      notifyListeners();
    }
  }
}
