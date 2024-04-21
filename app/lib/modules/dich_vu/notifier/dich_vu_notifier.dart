import 'package:app/modules/dich_vu/global.dart';
import 'package:flutter/material.dart';

class DichVuChangeNotifier extends ChangeNotifier {
  final List<Map<String, dynamic>> _dichVuYeuThich = dich_vu_veu_thich;
  List<Map<String, dynamic>> get dichVuYeuThich => _dichVuYeuThich;

  final List<Map<String, dynamic>> _thanhToan = dich_vu_veu_thich;
  List<Map<String, dynamic>> get thanhToan => _thanhToan;

  bool _isLuu = false;
  bool get isLuu => _isLuu;

  void changeLuaSua() {
    _isLuu = !_isLuu;
    print(_isLuu);
    notifyListeners();
  }

  // void removeItemYeuThich(Map<String, dynamic> item) {
  //   if (_isLuu == true) {
  //     _dichVuYeuThich.remove(item);
  //     notifyListeners();
  //   }
  // }
}
