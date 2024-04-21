import 'package:app/screens/bill_screen/modules/data/global_service.dart';
import 'package:app/screens/bill_screen/modules/notifier/bill_notifier/supplier_changenotifier.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class BottomSheetSupllier extends StatefulWidget {
  const BottomSheetSupllier({super.key});

  @override
  State<BottomSheetSupllier> createState() => _BottomSheetSupllierState();
}

class _BottomSheetSupllierState extends State<BottomSheetSupllier> {
  late TextEditingController controller;
  // late SupplierChangeNotifier supplierChangeNotifier;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    // supplierChangeNotifier =
    //     Provider.of<SupplierChangeNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'bill-management.choose-supplier'.tr(),
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
            FssTextField(
              controller: controller,
              hintText: 'bill-management.enter-search'.tr(),
              borderRadius: BorderRadius.circular(8),
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: 24,
                color: Color(0xff030E26),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: suppliers.length,
                    itemBuilder: (context, index) {
                      final item = suppliers[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item,
                              style: ThemeProvider.themeOf(context)
                                  .data
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff030E26)),
                            ),
                            if (index == 1)
                              Icon(
                                Icons.check,
                                color: ThemeProvider.themeOf(context)
                                    .data
                                    .primaryColor,
                              )
                          ],
                        ),
                      );
                    }))
          ]),
        ));
  }
}
