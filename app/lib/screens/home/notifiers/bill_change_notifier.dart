import 'package:flutter/material.dart';

class BillChangeNotifier with ChangeNotifier {
  bool _showAll = false;
  bool get showAll => _showAll;

  void onShowAll() {
    _showAll = !_showAll;
    notifyListeners();
  }
}
