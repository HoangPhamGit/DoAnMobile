import 'package:app/screens/bill_screen/widgets/bill_service_bottom.dart';
import 'package:app/screens/bill_screen/widgets/build_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class TypeService extends StatefulWidget {
  const TypeService({super.key});

  @override
  State<TypeService> createState() => _TypeServiceState();
}

class _TypeServiceState extends State<TypeService> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buildBottomSheet(
            context: context,
            bottomSheet: const BuildSerViceBottom(),
            size: 0.5);
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 12, top: 12, bottom: 12),
        width: 327,
        height: 72,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffE6E6E6), width: 1),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'bill-management.type-service'.tr(),
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
                Text(
                  'bill-management.water-bill'.tr(),
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodySmall!
                      .copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff030E26)),
                ),
                // Selector<BillChangNotifier, Map<String, dynamic>>(
                //   selector: (p0, p1) => p1.isService,
                //   shouldRebuild: (previous, next) => true,
                //   builder: (context, service, child) {
                //     if (service.isNotEmpty) {
                //       return Text(
                //         service['serviceName'],
                // style: ThemeProvider.themeOf(context)
                //     .data
                //     .textTheme
                //     .bodySmall!
                //     .copyWith(
                //         fontWeight: FontWeight.w400,
                //         color: const Color(0xff030E26)),
                //       );
                //     } else {
                //       return Text(
                //         'Hóa đơn nước',
                //         style: ThemeProvider.themeOf(context)
                //             .data
                //             .textTheme
                //             .bodySmall!
                //             .copyWith(
                //                 fontWeight: FontWeight.w400,
                //                 color: const Color(0xff030E26)),
                //       );
                //     }
                //   },
                // )
              ],
            ),
            Container(
                width: 48,
                height: 48,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image.asset(
                  'assets/images/ic_water.png',
                  fit: BoxFit.contain,
                ))
          ],
        ),
      ),
    );
  }
}
