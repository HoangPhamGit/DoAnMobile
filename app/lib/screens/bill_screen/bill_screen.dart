import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/screens/bill_screen/bill_page/bill_remind_page.dart';
import 'package:app/screens/bill_screen/modules/notifier/bill_notifier/bill_changnotifier.dart';
import 'package:app/screens/bill_screen/widgets/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/globals.dart' as globals;

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
        create: (context) => BillChangNotifier(), child: const BillScreen());
  }

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  late BillChangNotifier _notifier;
  @override
  void initState() {
    _notifier = Provider.of<BillChangNotifier>(context, listen: false);
    super.initState();
    // print('init create');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'bill-management.bill-title'.tr(),
          leading: InkWell(
            onTap: () {
              if (globals.navigatorContext != null) {
                Navigator.of(globals.navigatorContext!)
                    .pushNamed(AppRoutesConst.mainMenu);
              }
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
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
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Nội dung của Tab 1
                  BillRemindPage(
                    titleContent:
                        'bill-management.create-bill-reminder-schedule-now'
                            .tr(),
                    titleButton:
                        'bill-management.create-bill-reminder-schedule'.tr(),
                  ),
                  // Nội dung của Tab 2
                  BillRemindPage(
                    titleContent:
                        'bill-management.create-automatic-bill-payments-now'
                            .tr(),
                    titleButton:
                        'bill-management.create-automatic-bill-payments'.tr(),
                    isPayAuto: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
