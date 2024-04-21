import 'package:app/modules/register/widget/register_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildTermConBotSheet(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              "register.term-contract".tr(),
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const Divider(
          height: 16,
          thickness: 1,
          color: Color.fromRGBO(0, 0, 0, 0.05),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.9 - 209,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        const Spacer(),
        const SizedBox(
          height: 16,
        ),
        RegisterButton(
          doSomeThing: () {
            Navigator.of(context).pop();
          },
          buttonText: 'register.agree'.tr(),
          agree: true,
        )
      ],
    ),
  );
}
