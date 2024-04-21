import 'package:app/screens/bill_screen/modules/data/global_service.dart';
import 'package:flutter/material.dart';

class BillChangNotifier extends ChangeNotifier {
  final List<Map<String, dynamic>> _bill = bill_list;
  List<Map<String, dynamic>> get bill => _bill;

  final List<Map<String, dynamic>> _services = services;
  List<Map<String, dynamic>> get serVices => _services;

  Map<String, dynamic> _isService = {};
  Map<String, dynamic> get isService => _isService;

  void choseService(Map<String, dynamic> item) {
    _isService = item;
    notifyListeners();
    print('service bạn chọn là: $_isService');
  }
}
