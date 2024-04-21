import 'package:app/screens/bill_screen/widgets/bill_supplier_bottom.dart';
import 'package:app/screens/bill_screen/widgets/build_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_provider/theme_provider.dart';

class BillSelectSupply extends StatefulWidget {
  const BillSelectSupply({super.key});

  @override
  State<BillSelectSupply> createState() => _BillSelectSupplyState();
}

class _BillSelectSupplyState extends State<BillSelectSupply> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buildBottomSheet(
            context: context,
            bottomSheet: const BottomSheetSupllier(),
            size: 718 / 812);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12),
        width: 327,
        height: 62,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffE6E6E6), width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'bill-management.supplier'.tr(),
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodySmall!
                  .copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff030E26).withOpacity(0.4)),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Đông Tiến Thành',
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodySmall!
                      .copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff030E26)),
                ),
                // Selector<SupplierChangeNotifier, String>(
                //   selector: (p0, p1) => p1.supplier,
                //   shouldRebuild: (previous, next) => true,
                //   builder: (context, sup, child) {
                //     if (sup.isEmpty) {
                //       sup = 'Chọn nhà cung cấp';
                //     }
                // return Text(
                //   sup,
                //   style: ThemeProvider.themeOf(context)
                //       .data
                //       .textTheme
                //       .bodySmall!
                //       .copyWith(
                //           fontWeight: FontWeight.w400,
                //           color: const Color(0xff030E26)),
                // );
                //   },
                // ),
                InkWell(
                  onTap: () {
                    // buildBottomSheet(
                    //     context: context,
                    //     bottomSheet: const BottomSheetSupllier(),
                    //     size: 718 / 812);
                  },
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: SvgPicture.asset(
                      'assets/images/svg/ic_arrow_down.svg',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
