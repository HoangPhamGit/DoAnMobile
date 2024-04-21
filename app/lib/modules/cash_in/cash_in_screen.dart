import 'package:app/components/components.dart';
import 'package:app/modules/cash_in/cash_in_confirm_screen.dart';
import 'package:app/modules/cash_in/notifiers/cash_in_change_notifier.dart';
import 'package:app/modules/cash_in/widgets/account_balance.dart';
import 'package:app/modules/cash_in/widgets/amount_input_text_field.dart';
import 'package:app/modules/cash_in/widgets/header.dart';
import 'package:app/widgets/scaffold_base.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import 'widgets/suggested_price.dart';
import 'widgets/wallet_funding_source.dart';

class CashInScreen extends StatefulWidget {
  const CashInScreen({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => CashInChangeNotifier(),
      child: const CashInScreen(),
    );
  }

  @override
  State<CashInScreen> createState() => _CashInScreenState();
}

class _CashInScreenState extends State<CashInScreen> {
  final LoadingTextButtonController buttonController =
      LoadingTextButtonController();

  late CashInChangeNotifier _notifier;
  @override
  void initState() {
    _notifier = context.read<CashInChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      context,
      // titleAppBar: "Nạp tiền",
      backgroundColor:
          ThemeProvider.themeOf(context).data.colorScheme.background,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
              color: ThemeProvider.themeOf(context).data.primaryColor,
              child: Opacity(
                opacity: 0.7,
                child: Image.asset(
                  "assets/images/home_header.png",
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                  colorBlendMode: BlendMode.overlay,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).viewPadding.top,
              left: 0,
              right: 0,
              child: const Header(),
            ),
            Positioned.fill(
              top: 170,
              right: 0,
              left: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AccountBalance(),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 24),
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                "Nhập số tiền cần nạp",
                                style: ThemeProvider.themeOf(context)
                                    .data
                                    .textTheme
                                    .bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                              AmountInputTextField(
                                controller: _notifier.amountController,
                              ),
                              const SizedBox(height: 12),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 16),
                                    SuggestedPrice(
                                      price: 50000,
                                      onPressed: (value) {
                                        _notifier
                                            .onPressedSuggestedPrice(value);
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                    SuggestedPrice(
                                      price: 100000,
                                      onPressed: (value) {
                                        _notifier
                                            .onPressedSuggestedPrice(value);
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                    SuggestedPrice(
                                      price: 200000,
                                      onPressed: (value) {
                                        _notifier
                                            .onPressedSuggestedPrice(value);
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                    SuggestedPrice(
                                      price: 500000,
                                      onPressed: (value) {
                                        _notifier
                                            .onPressedSuggestedPrice(value);
                                      },
                                    ),
                                    const SizedBox(width: 16),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: const WalletFundingSource())
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: LoadingTextButton(
                      controller: buttonController,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          useRootNavigator: true,
                          builder: (context) => const TitleModalBottomSheet(
                            title: "Nạp tiền",
                            child: CashInConfirmScreen(),
                          ),
                        );
                      },
                      title: "Tiếp theo",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
