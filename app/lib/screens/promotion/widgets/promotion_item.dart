import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class PromotionItem extends StatelessWidget {
  const PromotionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(),
        ),
        Row(
          children: [
            SizedBox(
              height: 65,
              width: 65,
              child: Image.asset(
                "assets/images/promotion_demo.jpg",
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "TH True mart - Vương Thừa Vũ",
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall
                        ?.copyWith(
                            color: ThemeProvider.themeOf(context)
                                .data
                                .primaryColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Giảm 8.283₫ cho vài mặt hàng",
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Hạn cuối: 16 tháng 2, 2024 - 23:59",
                    style:
                        ThemeProvider.themeOf(context).data.textTheme.bodySmall,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
