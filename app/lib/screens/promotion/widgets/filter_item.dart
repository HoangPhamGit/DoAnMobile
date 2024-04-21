import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class FilterItem extends StatelessWidget {
  final String title;
  final Color? borderColor;
  final TextStyle? titleTextStyle;
  const FilterItem(
      {super.key, required this.title, this.borderColor, this.titleTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? const Color(0xffE6E6E6),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      child: Row(
        children: [
          Center(
            child: Text(
              title,
              style: titleTextStyle ??
                  ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 12),
            ),
          ),
          const Icon(
            Icons.expand_more,
            color: Color(0xffE6E6E6),
            size: 20,
          )
        ],
      ),
    );
  }
}
