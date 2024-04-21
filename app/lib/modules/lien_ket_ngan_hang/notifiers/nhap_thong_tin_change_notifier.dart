import 'package:flutter/material.dart';

class NhapThongTinChangeNotifier extends ChangeNotifier {
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  TextEditingController hieuLucController = TextEditingController();

  void setDate(int month, int year) {
    this.month = month;
    this.year = year;
    print('Pick Time: $month /$year');
  }

  String get getTime => '$month/$year';

  void hieuLucTime() {
    if (month == DateTime.now().month && year == DateTime.now().year) {
      hieuLucController.text = '--/--';
    } else {
      hieuLucController.text = getTime;
    }

    notifyListeners();
  }
}
