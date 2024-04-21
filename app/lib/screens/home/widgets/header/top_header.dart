import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:app/globals.dart' as globals;
import '../../../../configs/routes/app_routes_const.dart';

class TopHeader extends StatelessWidget {
  final bool isCollapsed;
  const TopHeader({super.key, this.isCollapsed = false});

  @override
  Widget build(BuildContext context) {
    return (!isCollapsed)
        ? Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.6),
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.05,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: svgAvatarDefault(),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "Xin chào, Linh",
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleMedium!
                    .copyWith(
                      color: Colors.white,
                    ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  if (globals.navigatorContext != null) {
                    Navigator.of(globals.navigatorContext!)
                        .pushNamed(AppRoutesConst.accountNotification);
                  }
                },
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const SizedBox(
                width: 24,
                height: 24,
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          )
        : Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.6),
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.05,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: svgAvatarDefault(),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "Số dư: ",
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white.withOpacity(0.4)),
              ),
              const SizedBox(width: 4),
              Text(
                "•••",
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.visibility_outlined,
                color: Color(0xff4AF1E7),
                size: 20,
              ),
              const Spacer(),
              const SizedBox(
                width: 24,
                height: 24,
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              const SizedBox(
                width: 24,
                height: 24,
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          );
  }

  SvgPicture svgAvatarDefault() {
    return SvgPicture.asset(
      "assets/images/svg/avatar_default.svg",
      color: Colors.white,
      fit: BoxFit.fill,
    );
  }
}
