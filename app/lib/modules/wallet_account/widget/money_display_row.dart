import 'package:app/modules/wallet_account/widget/vnd_display.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class MoneyDisplayRow extends StatelessWidget {
  const MoneyDisplayRow(
      {super.key,
      required this.moneyLeft,
      required this.moneyRight,
      required this.titleLeft,
      required this.titleRight});
  final String moneyLeft;
  final String titleLeft;
  final String moneyRight;
  final String titleRight;

  @override
  Widget build(BuildContext context) {
    TextStyle labelTextStyle =
        ThemeProvider.themeOf(context).data.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.white.withOpacity(0.4),
            );

    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                titleLeft,
                style: labelTextStyle,
              ),
              buildVndUnderline(context: context, text: moneyLeft)
            ],
          ),
          VerticalDivider(
            width: 48,
            thickness: 1,
            color: Colors.white.withOpacity(0.15),
          ),
          Column(
            children: [
              Text(
                titleRight,
                style: labelTextStyle,
              ),
              buildVndUnderline(context: context, text: moneyRight)
            ],
          ),
        ],
      ),
    );
  }
}
