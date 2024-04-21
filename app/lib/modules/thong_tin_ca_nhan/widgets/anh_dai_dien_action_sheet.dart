import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildThayAnhActionSheet(BuildContext context) {
  return Container(
    child: CupertinoActionSheet(
        title: Text(
          'account-info.button.change-picture'.tr(),
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {},
              child: Text(
                'account-info.button.take-picture'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        color: const Color.fromRGBO(22, 88, 228, 1),
                        fontWeight: FontWeight.w400),
              )),
          CupertinoActionSheetAction(
              onPressed: () {},
              child: Text(
                'account-info.button.upload-picture'.tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        color: const Color.fromRGBO(22, 88, 228, 1),
                        fontWeight: FontWeight.w400),
              ))
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {},
          child: Text(
            'account-info.button.skip'.tr(),
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodyMedium!
                .copyWith(
                    color: const Color.fromRGBO(22, 88, 228, 1),
                    fontWeight: FontWeight.w600),
          ),
        )),
  );
}
