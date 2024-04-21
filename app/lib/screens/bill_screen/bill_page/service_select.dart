import 'package:app/screens/bill_screen/bill_page/bill_infomation_page.dart';
import 'package:app/screens/bill_screen/bill_page/bill_pay_information.dart';
import 'package:app/screens/bill_screen/modules/data/global_service.dart';
import 'package:app/screens/bill_screen/widgets/custom_appbar.dart';
import 'package:app/screens/bill_screen/widgets/item_service_bill.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectService extends StatefulWidget {
  final bool? showCard;
  const SelectService({super.key, this.showCard});

  // static Widget create() {
  //   return ChangeNotifierProvider(
  //       create: (context) => BillChangNotifier(), child: const SelectService());
  // }

  @override
  State<SelectService> createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  // late BillChangNotifier billChangNotifier;
  @override
  void initState() {
    // TODO: implement initState
    // billChangNotifier = Provider.of<BillChangNotifier>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'bill-management.choose-service'.tr()),
      body: SingleChildScrollView(
        child: Container(
          width: 375,
          height: 718,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final item = services[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (widget.showCard ?? false) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BillPayInformation()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BillInformationPage()));
                      }
                    });
                  },
                  child: ItemService(
                    imagePath: item['imagePath'],
                    serviceName: item['serviceName'],
                  ),
                );
              }),
          // child: Selector<BillChangNotifier, List<Map<String, dynamic>>>(
          //   selector: (p0, p1) => p1.serVices,
          //   shouldRebuild: (previous, next) => true,
          //   builder: (context, value, child) {
          //     return ListView.builder(
          //         itemCount: value.length,
          //         itemBuilder: (context, index) {
          //           final item = value[index];
          //           return InkWell(
          //             onTap: widget.onpress,
          //             child: ItemService(
          //               imagePath: item['imagePath'],
          //               serviceName: item['serviceName'],
          //             ),
          //           );
          //         });
          //   },
          // ),
        ),
      ),
    );
  }
}
