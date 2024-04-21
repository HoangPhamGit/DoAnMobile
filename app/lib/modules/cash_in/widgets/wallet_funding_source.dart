import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class WalletFundingSource extends StatefulWidget {
  const WalletFundingSource({super.key});

  @override
  State<WalletFundingSource> createState() => WwalletFundingSourceState();
}

class WwalletFundingSourceState extends State<WalletFundingSource> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Nạp từ nguồn tiền",
          style: ThemeProvider.themeOf(context).data.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  color: ThemeProvider.themeOf(context)
                      .data
                      .colorScheme
                      .background,
                  border: Border.all(
                    color: ThemeProvider.themeOf(context).data.dividerColor,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/bank/mb.png",
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Text(
                              "MB",
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: Text(
                                "*5383",
                                style: ThemeProvider.themeOf(context)
                                    .data
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 12,
                                      color: ThemeProvider.themeOf(context)
                                          .data
                                          .primaryColor,
                                    ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Miễn phí giao dịch",
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: ThemeProvider.themeOf(context)
                                    .data
                                    .primaryColor,
                              ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 24,
                    child: Radio(
                      value: true,
                      groupValue: true,
                      onChanged: (value) {
                        ///
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  color: ThemeProvider.themeOf(context)
                      .data
                      .colorScheme
                      .background,
                  border: Border.all(
                    color: ThemeProvider.themeOf(context).data.dividerColor,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ThemeProvider.themeOf(context)
                            .data
                            .primaryColor
                            .withOpacity(0.05),
                        shape: BoxShape.circle),
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.account_balance_outlined,
                      size: 24,
                      color: ThemeProvider.themeOf(context).data.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text("Thẻ/TK ngân hàng khác",
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .titleMedium),
                  ),
                  SizedBox(
                    width: 24,
                    child: Radio(
                      value: true,
                      groupValue: true,
                      onChanged: (value) {
                        ///
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
