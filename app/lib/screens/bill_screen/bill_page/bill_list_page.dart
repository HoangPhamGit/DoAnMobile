import 'package:app/screens/bill_screen/bill_page/service_select.dart';
import 'package:app/screens/bill_screen/widgets/bill_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BillListPage extends StatefulWidget {
  const BillListPage({super.key});

  @override
  State<BillListPage> createState() => _BillListPageState();
}

class _BillListPageState extends State<BillListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 34,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff030E26),
                    ),
                    Text(
                      'bill-management.all-status'.tr(),
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .bodySmall!
                          .copyWith(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff030E26)),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectService()));
                  },
                  child: Container(
                    width: 96,
                    height: 34,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xff1658E4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'bill-management.create-calendar'.tr(),
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.add_circle_outline_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Expanded(
            child: BillItem(),
          )
        ],
      ),
    );
  }
}
