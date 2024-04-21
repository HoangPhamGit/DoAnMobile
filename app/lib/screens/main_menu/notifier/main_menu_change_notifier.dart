import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

class MainMenuChangeNotifier with ChangeNotifier {
  CustomerResponse? customer;
  Future<void> loadCustomer() async {
    final accountApi = locator<AccountApi>();
    var response = await accountApi.getCustomer();
    customer = response;
    notifyListeners();
  }
}
