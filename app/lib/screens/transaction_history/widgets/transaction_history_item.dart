import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class TransactionHistoryItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final String content;
  final Function()? onPressed;
  const TransactionHistoryItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.content,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                iconPath,
                width: 48,
                height: 48,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleMedium,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    content,
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                          height: 1.3,
                        ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 48,
                child: Icon(
                  Icons.navigate_next_outlined,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
