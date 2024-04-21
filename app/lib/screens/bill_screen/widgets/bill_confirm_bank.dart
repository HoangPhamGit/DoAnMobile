import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/register/build_bottom_sheet.dart';
import 'package:app/screens/bill_screen/widgets/bill_otp.dart';
import 'package:app/screens/bill_screen/widgets/bill_text.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BillConfirmBank extends StatefulWidget {
  const BillConfirmBank({super.key});

  @override
  State<BillConfirmBank> createState() => _BillConfirmBankState();
}

class _BillConfirmBankState extends State<BillConfirmBank> {
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
                  'Xác nhận hóa đơn',
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
              height: 32,
            ),
            SizedBox(
              width: double.infinity,
              height: 98,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nguồn tiền',
                    style: ThemeProvider.themeOf(context)
                        .data
                        .textTheme
                        .titleSmall!
                        .copyWith(
                            color: const Color(0xff030E26),
                            fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 72,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1,
                            color: const Color(0xff000000).withOpacity(0.05))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: const Color(0xff1658E4),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Image.asset('assets/images/vector.png'),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'FlexPay',
                                      style: ThemeProvider.themeOf(context)
                                          .data
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff030E26)),
                                    ),
                                    Text(
                                      'Số dư: 12.394.232đ',
                                      style: ThemeProvider.themeOf(context)
                                          .data
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff030E26)
                                                  .withOpacity(0.4)),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const BillText(titleName: 'Dịch vụ', content: 'Hóa đơn nước'),
            const BillText(
                titleName: 'Nhà cung cấp', content: 'Đông Tiến Thành'),
            const BillText(titleName: 'Mã khách hàng', content: '9981239813'),
            const BillText(
                titleName: 'Tên khách hàng', content: 'Nguyễn Văn A'),
            LoadingTextButton(
                controller: controller,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(AppRoutesConst.billSuccess);
                  buildBottomSheet(
                      context: context,
                      bottomSheet: const BillOTP(
                        phoneNumber: '0123456789',
                      ),
                      size: 676 / 812);
                },
                title: 'Xác nhận')
          ],
        ),
      ),
    );
  }
}
