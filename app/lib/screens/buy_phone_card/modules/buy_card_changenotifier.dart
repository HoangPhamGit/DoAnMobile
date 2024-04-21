import 'package:app/screens/buy_phone_card/modules/data/global.dart';
import 'package:flutter/material.dart';

class BuyPhoneCardChangenotifier extends ChangeNotifier {
  final List<Map<String, dynamic>> _danhBa = danh_ba;
  List<Map<String, dynamic>> get danhBa => _danhBa;
  Map<String, dynamic> _object = {};
  Map<String, dynamic> get object => _object;

  final List<double> _menhGia = menhGia;
  List<double> get giaMenh => _menhGia;

  double _giaNap = 1;
  double get giaNap => _giaNap;

  int _soLuongThe = 1;
  int get soLuongThe => _soLuongThe;

  double _selectedIndex = -1;
  double get selectedIndex => _selectedIndex;

  void giamSL() {
    if (_soLuongThe > 1) {
      _soLuongThe--;
      notifyListeners();
      print(_soLuongThe);
    }
  }

  void tangSL() {
    _soLuongThe++;
    notifyListeners();
    print(_soLuongThe);
  }

  void choseMenhGia(double gia) {
    _giaNap = gia;
    _selectedIndex = _giaNap;
    notifyListeners();
    print('Giá nạp: $_giaNap');
    print('select: $_selectedIndex');
  }

  bool chon() {
    if (_selectedIndex == giaNap) {
      return true;
    }
    return false;
  }

  double tamTinh() {
    return _giaNap * _soLuongThe;
  }

  void choseUser(Map<String, dynamic> item) {
    _object = item;
    notifyListeners();
    print(_object['nameUser']);
  }
}
