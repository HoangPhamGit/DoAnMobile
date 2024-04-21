import 'package:app/modules/wallet_account/notifier/money_model.dart';
import 'package:flutter/material.dart';

class WalletAccountChangeNotifier extends ChangeNotifier {
  late TabController tabController;
  int get index => tabController.index;
  List<AccountMoney> get chartData => getAccountMoney();
  List<AccountMoney> getAccountMoney() {
    final List<AccountMoney> money = [
      AccountMoney(6938223, 'Số dư khả dụng'),
      AccountMoney(12938223, 'Số dư phong tỏa'),
      AccountMoney(300000000, 'Hạn mức giao dịch'),
      AccountMoney(242938223, 'Hạn mức còn lại'),
    ];
    return money;
  }
}
