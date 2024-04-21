import 'package:app/screens/transaction_history/transaction_history_change_notifier.dart';
import 'package:app/widgets/fss_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import 'widgets/transaction_history_item.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => TransactionHistoryChangeNotifier(),
      child: const TransactionHistory(),
    );
  }

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  // final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: ThemeProvider.themeOf(context).data.colorScheme.background,
        child: Stack(
          children: [
            Container(
              color: ThemeProvider.themeOf(context).data.primaryColor,
            ),
            Positioned(
              top: MediaQuery.of(context).viewPadding.top,
              left: 0,
              right: 0,
              child: _buildHeader(context),
            ),
            Positioned.fill(
              top: 150,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                decoration: BoxDecoration(
                  color: ThemeProvider.themeOf(context)
                      .data
                      .colorScheme
                      .background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    const FssSearch(),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: const [
                          TransactionHistoryItem(
                            iconPath:
                                "assets/images/money_transfer_service.png",
                            title: "Chuyển tiền ra ngoài",
                            content:
                                "Bạn đã chuyển số tiền 438.223₫ từ ví FlexPay sang tài khoản Vietcombank",
                            onPressed: null,
                          ),
                          TransactionHistoryItem(
                            iconPath: "assets/images/water_bill_service.png",
                            title: "Thanh toán hoá đơn nước",
                            content:
                                "Bạn đã chuyển số tiền 438.223₫ từ ví FlexPay sang tài khoản Vietcombank.",
                            onPressed: null,
                          ),
                          TransactionHistoryItem(
                            iconPath: "assets/images/bill_payment_service.png",
                            title: "Thanh toán hoá đơn",
                            content:
                                "Bạn đã chuyển số tiền 438.223₫ từ ví FlexPay sang tài khoản Vietcombank.",
                            onPressed: null,
                          ),
                          TransactionHistoryItem(
                            iconPath: "assets/images/recharge_service.png",
                            title: "Nạp tiền vào tài khoản",
                            content:
                                "Bạn đã chuyển số tiền 438.223₫ từ ví FlexPay sang tài khoản Vietcombank.",
                            onPressed: null,
                          ),
                          TransactionHistoryItem(
                            iconPath:
                                "assets/images/money_transfer_service.png",
                            title: "Chuyển tiền ra ngoài",
                            content:
                                "Bạn đã chuyển số tiền 438.223₫ từ ví FlexPay sang tài khoản Vietcombank",
                            onPressed: null,
                          ),
                          TransactionHistoryItem(
                            iconPath: "assets/images/water_bill_service.png",
                            title: "Thanh toán hoá đơn nước",
                            content:
                                "Bạn đã chuyển số tiền 438.223₫ từ ví FlexPay sang tài khoản Vietcombank.",
                            onPressed: null,
                          ),
                          TransactionHistoryItem(
                            iconPath: "assets/images/bill_payment_service.png",
                            title: "Thanh toán hoá đơn",
                            content:
                                "Bạn đã chuyển số tiền 438.223₫ từ ví FlexPay sang tài khoản Vietcombank.",
                            onPressed: null,
                          ),
                          TransactionHistoryItem(
                            iconPath: "assets/images/recharge_service.png",
                            title: "Nạp tiền vào tài khoản",
                            content:
                                "Bạn đã chuyển số tiền 438.223₫ từ ví FlexPay sang tài khoản Vietcombank.",
                            onPressed: null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Text(
                  "Lịch sử giao dịch",
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleLarge!
                      .copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.white.withOpacity(0.15)),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 6),
                      child: Row(
                        children: [
                          Center(
                            child: Text(
                              "Tất cả giao dịch",
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                          const Icon(
                            Icons.expand_more,
                            color: Colors.white70,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.white.withOpacity(0.15)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 6),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white70,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Trong 30 ngày qua",
                                  style: ThemeProvider.themeOf(context)
                                      .data
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.expand_more,
                              color: Colors.white70,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
