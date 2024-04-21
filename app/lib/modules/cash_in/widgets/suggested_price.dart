import 'package:app/commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class SuggestedPrice extends StatelessWidget {
  final double price;
  final Function(double) onPressed;
  const SuggestedPrice({
    super.key,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        onPressed(price);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: ThemeProvider.themeOf(context).data.dividerColor,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Text(
          "${NumberFormatter.formatPrice(price)}đ",
          style: ThemeProvider.themeOf(context).data.textTheme.titleSmall,
        ),
      ),
    );
  }
}
