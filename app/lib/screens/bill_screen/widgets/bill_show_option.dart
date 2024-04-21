import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Future showMoreOption({required context, double? size, bool? isPayAuto}) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        title: Text('bill-management.option'.tr()),
        actions: [
          Container(
            color: Colors.white,
            child: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {},
              child: Text(
                'bill-management.delete-bill'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        color: const Color(0xffEC1D25),
                        fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {},
              child: Text(
                'bill-management.edit-bill'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        color: const Color(0xff1658E4),
                        fontWeight: FontWeight.w400),
              ),
            ),
          ),
          isPayAuto ?? false
              ? Container()
              : Container(
                  color: Colors.white,
                  child: CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () {},
                    child: Text(
                      'bill-management.set-up-auto-payment'.tr(),
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: const Color(0xff1658E4),
                              fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {},
          child: Text(
            'bill-management.skip'.tr(),
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodyMedium!
                .copyWith(
                    color: const Color(0xff1658E4),
                    fontWeight: FontWeight.w600),
          ),
        ),
      );
    },
  );
}
