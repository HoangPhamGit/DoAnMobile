import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class AppBarTopUp extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? elevation;
  const AppBarTopUp({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.textStyle,
    this.elevation,
  });

  @override
  State<AppBarTopUp> createState() => _AppBarTopUpState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarTopUpState extends State<AppBarTopUp> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: widget.elevation ?? 0.3,
      backgroundColor: widget.backgroundColor ?? Colors.white,
      title: Text(
        widget.title,
        style: widget.textStyle ??
            ThemeProvider.themeOf(context).data.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600, color: const Color(0xff030E26)),
      ),
      leading: widget.leading,
      centerTitle: true,
    );
  }
}
