import 'package:app/screens/bill_screen/modules/data/global_service.dart';
import 'package:app/screens/bill_screen/widgets/item_service_bill.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BuildSerViceBottom extends StatefulWidget {
  const BuildSerViceBottom({super.key});

  @override
  State<BuildSerViceBottom> createState() => _BuildSerViceBottomState();
}

class _BuildSerViceBottomState extends State<BuildSerViceBottom> {
  late bool isSave = false;
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
                  'bill-management.choose-service'.tr(),
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
            Expanded(
              child: ListView(
                children: [
                  ItemService(
                    imagePath: 'assets/images/ic_electricity.png',
                    serviceName: 'bill-management.electric-bill'.tr(),
                    showIcon: false,
                  ),
                  ItemService(
                    imagePath: 'assets/images/ic_water.png',
                    serviceName: 'bill-management.water-bill'.tr(),
                    showIcon: false,
                    check: true,
                  ),
                  ItemService(
                    imagePath: 'assets/images/ic_postpaid_phone.png',
                    serviceName: 'bill-management.postpaid-phone'.tr(),
                    showIcon: false,
                  ),
                  ItemService(
                    imagePath: 'assets/images/ic_internet.png',
                    serviceName: 'bill-management.internet-bill'.tr(),
                    showIcon: false,
                  ),
                  ItemService(
                    imagePath: 'assets/images/ic_education.png',
                    serviceName: 'bill-management.tuition'.tr(),
                    showIcon: false,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
