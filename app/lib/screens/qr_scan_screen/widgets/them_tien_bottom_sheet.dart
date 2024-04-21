import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/screens/qr_scan_screen/notifier/qr_scan_notifier.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

Widget buildThemTienBotSheet({
  required BuildContext context,
  required LoadingTextButtonController btnController,
  required TextEditingController textController,
  required QRScanChangeNotifier notifier,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.width * 0.6,
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        Row(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 24,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                'QR.content.so-tien-nhan'.tr(),
                textAlign: TextAlign.center,
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleMedium!
                    .copyWith(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        Divider(
          height: 16,
          thickness: 1,
          color: Colors.black.withOpacity(0.05),
        ),
        FssTextField(
          controller: textController,
          hintText: 'QR.content.so-tien'.tr(),
          textInputType: const TextInputType.numberWithOptions(),
        ),
        const SizedBox(
          height: 16,
        ),
        LoadingTextButton(
            controller: btnController,
            onPressed: () {
              notifier.formatedMoney =
                  notifier.formatPrice(double.parse(textController.text));
              print(notifier.formatedMoney);
            },
            title: 'QR.button.next'.tr())
      ],
    ),
  );
}
