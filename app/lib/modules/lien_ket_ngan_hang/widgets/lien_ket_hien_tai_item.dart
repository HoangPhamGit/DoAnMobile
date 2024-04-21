import 'package:app/configs/routes/app_routes_const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildLienKetItem({
  required BuildContext context,
  required String tenNganHang,
  required String soTk,
  required String imgPath,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, AppRoutesConst.chiTietThe);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          child: Image.asset(imgPath),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    tenNganHang,
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    padding: const EdgeInsets.only(
                        top: 2, right: 4, bottom: 2, left: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromRGBO(22, 88, 228, 0.1)),
                    child: Text(
                      'link-card.content.mac-dinh'.tr(),
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .bodySmall!
                          .copyWith(
                              fontSize: 12,
                              color: const Color.fromRGBO(22, 88, 228, 1)),
                    ),
                  ),
                  const Spacer(),
                  const InkWell(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color.fromRGBO(3, 14, 38, 0.4),
                    ),
                  )
                ],
              ),
              Text(
                soTk,
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall!
                    .copyWith(
                        color: const Color.fromRGBO(3, 14, 38, 0.4),
                        fontWeight: FontWeight.w400),
              )
            ],
          ),
        )
      ],
    ),
  );
}
