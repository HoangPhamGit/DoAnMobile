import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theme_provider/theme_provider.dart';

import 'items/news_item.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildNewsHeader(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 7,
            padding: const EdgeInsets.only(top: 16),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 8,
              mainAxisExtent: MediaQuery.of(context).size.width / 2 + 50,
            ),
            itemBuilder: (_, index) {
              return const NewsItem();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewsHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('home-screen.titles.preferential'.tr(),
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
