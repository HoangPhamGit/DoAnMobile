import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class QRScanChangeNotifier extends ChangeNotifier {
  bool isAddMoney = false;
  String formatPrice(dynamic value) {
    var numberFormat = NumberFormat("###,###", "en_US");
    notifyListeners();
    return numberFormat.format(value ?? 0);
  }

  String formatedMoney = '';

  void deleteMoney() {
    formatedMoney = '';
    notifyListeners();
  }
}
