import 'package:app/screens/bill_screen/modules/data/global_service.dart';
import 'package:flutter/material.dart';

class SupplierChangeNotifier extends ChangeNotifier {
  final List<String> _data = suppliers;
  List<String> get data => _data;
  String _supplier = '';
  String get supplier => _supplier;
  int _vitri = -1;
  int get vitri => _vitri;
  void choseSupplier(String item) {
    _supplier = item;
    notifyListeners();
    print('supploer: $_supplier');
  }

  void changeViTri(int index) {
    _vitri = index;
    print(_vitri);
    notifyListeners();
  }
}
