import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theme_provider/theme_provider.dart';

import 'items/promotion_item.dart';

class Promotion extends StatefulWidget {
  const Promotion({super.key});

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildPromotionHeader(context),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              PromotionItem(),
              PromotionItem(),
              PromotionItem(
                isLastIndex: true,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPromotionHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('home-screen.titles.promotion'.tr(),
              style: ThemeProvider.themeOf(context).data.textTheme.titleMedium),
          Text(
            "base.all".tr(),
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .titleMedium
                ?.copyWith(
                    color: ThemeProvider.themeOf(context).data.primaryColor),
          ),
        ],
      ),
    );
  }
}
