import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  const CustomAppBar(
      {super.key, required this.title, this.actions, this.leading});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.2,
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xff030E26),
      title: Text(
        title,
        style: ThemeProvider.themeOf(context)
            .data
            .textTheme
            .titleMedium!
            .copyWith(
                fontWeight: FontWeight.w700, color: const Color(0xff030E26)),
      ),
      leading: leading,
      centerTitle: true,
    );
  }
}
