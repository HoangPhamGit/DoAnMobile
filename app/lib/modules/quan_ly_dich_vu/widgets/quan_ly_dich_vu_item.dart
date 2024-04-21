import 'package:app/modules/quan_ly_dich_vu/widgets/icon_them_bot.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildQuanLyDichVuItem(
    {required BuildContext context,
    required imgPath,
    bool? isChange,
    required isAdd,
    required String text}) {
  return Stack(children: [
    Container(
      width: 69.75,
      height: 98,
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Image.asset(
            imgPath,
            width: 48,
            height: 48,
          ),
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.visible,
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleSmall!
                  .copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(40, 40, 53, 1)),
            ),
          )
        ],
      ),
    ),
    isChange ?? false
        ? Positioned(
            top: 2,
            left: 44,
            child: buildAddDeleteIcon(
              context: context,
              isAdd: isAdd,
            ))
        : Container()
  ]);
}
