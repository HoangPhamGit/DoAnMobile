import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme_provider/theme_provider.dart';

class MenuItem extends StatelessWidget {
  final String svgIconPath;
  final String title;
  final Function()? onPressed;
  final Widget? suffixWidget;
  const MenuItem({
    super.key,
    required this.title,
    required this.svgIconPath,
    this.suffixWidget,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: ThemeProvider.themeOf(context)
                    .data
                    .primaryColor
                    .withOpacity(0.05),
              ),
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                svgIconPath,
                width: 24,
                height: 24,
                color: ThemeProvider.themeOf(context).data.primaryColor,
              ),
            ),
            const SizedBox(width: 9),
            Text(
              title,
              style: ThemeProvider.themeOf(context).data.textTheme.bodySmall,
            ),
            const Spacer(),
            (suffixWidget != null)
                ? suffixWidget!
                : Icon(
                    Icons.navigate_next_outlined,
                    color: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .bodySmall
                        ?.color,
                  ),
          ],
        ),
      ),
    );
  }
}
