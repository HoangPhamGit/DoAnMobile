import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildThayAnhBottomSheet(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 24),
    child: Column(
      children: [
        Container(
          width: 40,
          height: 4,
          color: const Color.fromRGBO(216, 218, 229, 1),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Thay đổi ảnh đại diện',
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(
          height: 16,
        ),
        buildThayAnhButton(
          context: context,
          icon: Icons.wallpaper_rounded,
          title: 'Chọn từ thư viện',
        ),
        const SizedBox(
          height: 16,
        ),
        buildThayAnhButton(
          context: context,
          icon: Icons.photo_camera_outlined,
          title: 'Chụp ảnh',
        ),
      ],
    ),
  );
}

Widget buildThayAnhButton(
    {required BuildContext context,
    required IconData icon,
    required String title}) {
  return Container(
    padding: const EdgeInsets.all(16),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: const Border.fromBorderSide(
            BorderSide(width: 1, color: Color.fromRGBO(3, 14, 38, 0.2)))),
    child: Row(
      children: [
        Icon(
          icon,
          color: ThemeProvider.themeOf(context).data.primaryColor,
          size: 24,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .bodySmall!
              .copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(3, 14, 38, 0.4)),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 24,
          color: Color.fromRGBO(3, 14, 38, 0.6),
        ),
      ],
    ),
  );
}
