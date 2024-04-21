import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/register/build_bottom_sheet.dart';
import 'package:app/screens/bill_screen/widgets/bill_otp.dart';
import 'package:app/screens/bill_screen/widgets/bill_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:app/globals.dart' as globals;

class BillConfirm extends StatefulWidget {
  const BillConfirm({super.key});

  @override
  State<BillConfirm> createState() => _BillConfirmState();
}

class _BillConfirmState extends State<BillConfirm> {
  late LoadingTextButtonController controller = LoadingTextButtonController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'bill-management.bill-confirm'.tr(),
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff030E26)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.clear),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            BillText(
                titleName: 'bill-management.service'.tr(),
                content: 'bill-management.water-bill'.tr()),
            BillText(
                titleName: 'bill-management.supplier'.tr(),
                content: 'Đông Tiến Thành'),
            BillText(
                titleName: 'bill-management.customer-code'.tr(),
                content: '9981239813'),
            BillText(
                titleName: 'bill-management.customer-name'.tr(),
                content: 'Nguyễn Văn A'),
            LoadingTextButton(
                controller: controller,
                onPressed: () {
                  buildBottomSheet(
                      context: context,
                      bottomSheet: BillOTP(
                        phoneNumber: '0123456789',
                        onCompleted: (value) {
                          if (value == '123456') {
                            if (globals.navigatorContext != null) {
                              Navigator.of(globals.navigatorContext!)
                                  .pushNamed(AppRoutesConst.billSuccess);
                            }
                          }
                        },
                      ),
                      size: 676 / 812);
                },
                title: 'bill-management.confirm'.tr())
          ],
        ),
      ),
    );
  }
}
