import 'package:app/commons/commons.dart';
import 'package:flutter/material.dart';

class CashInChangeNotifier with ChangeNotifier {
  final TextEditingController amountController = TextEditingController();

  void onPressedSuggestedPrice(double value) {
    amountController.text = NumberFormatter.formatPrice(value);
  }
}
