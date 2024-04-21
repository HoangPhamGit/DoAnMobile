import 'package:app/components/components.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildThayThongTinSheet(BuildContext context, String title,
    LoadingTextButtonController btnController) {
  return Container(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        Row(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
              ),
            ),
            Expanded(
              child: Text(
                '${'account-info.title.change'.tr()} ${title.toLowerCase()}',
                textAlign: TextAlign.center,
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleMedium!
                    .copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            )
          ],
        ),
        Divider(
          thickness: 1,
          height: 32,
          color: Colors.black.withOpacity(0.05),
        ),
        FssTextField(
          hintText: 'account-info.row-label.email'.tr(),
        ),
        const SizedBox(
          height: 16,
        ),
        LoadingTextButton(
            controller: btnController,
            onPressed: () {},
            title: 'account-info.button.confirm'.tr())
      ],
    ),
  );
}
