import 'package:app/screens/bill_screen/bill_page/bill_list_page.dart';
import 'package:app/screens/bill_screen/bill_page/bill_payauto_page_success.dart';
import 'package:app/screens/bill_screen/modules/notifier/bill_notifier/bill_changnotifier.dart';
import 'package:app/screens/bill_screen/modules/notifier/bill_notifier/supplier_changenotifier.dart';
import 'package:app/screens/bill_screen/widgets/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillSuccessPage extends StatefulWidget {
  const BillSuccessPage({super.key});
  static Widget create() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SupplierChangeNotifier()),
        ChangeNotifierProvider(create: (context) => BillChangNotifier())
      ],
      child: const BillSuccessPage(),
    );
  }

  @override
  State<BillSuccessPage> createState() => _BillSuccessPageState();
}

class _BillSuccessPageState extends State<BillSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'bill-management.bill-title'.tr(),
          leading: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                isScrollable: false,
                labelColor: const Color(0xff1658E4),
                unselectedLabelColor: const Color(0xff030E26).withOpacity(0.4),
                tabs: [
                  Tab(
                    child: Text(
                      'bill-management.bill-reminder'.tr(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'bill-management.automatic-payment'.tr(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // Nội dung của Tab 1
                  BillListPage(),
                  // Nội dung của Tab 2
                  BillPayAutoPage()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
