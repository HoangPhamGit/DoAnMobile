import 'package:app/modules/xac_thuc_giay_to/notifier/chon_loai_giay_to_change_notitfier.dart';
import 'package:app/modules/xac_thuc_giay_to/notifier/chup_cccd_mat_sau_change_notifier.dart';
import 'package:app/modules/xac_thuc_giay_to/notifier/chup_cccd_mat_truoc_change_notifier.dart';
import 'package:app/modules/xac_thuc_giay_to/notifier/chup_khuon_mat_change_notifier.dart';
import 'package:app/modules/xac_thuc_giay_to/pages/chon_loai_giay_to.dart';
import 'package:app/modules/xac_thuc_giay_to/pages/chup_mat_truoc_cccd.dart';
import 'package:app/modules/xac_thuc_giay_to/xac_thuc_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//
class XacThuc extends StatefulWidget {
  const XacThuc({super.key});
  static Widget create() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => XacThucChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChupCCCDMatTruocChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChupCCCDMatSauChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChupKhuonMatChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChonLoaiGiayToChangeNotifier(),
        ),
      ],
      child: const XacThuc(),
    );
  }

  @override
  State<XacThuc> createState() => _XacThucState();
}

class _XacThucState extends State<XacThuc> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late XacThucChangeNotifier _notifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notifier = context.read<XacThucChangeNotifier>();
    _notifier.tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: _notifier.tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            const ChonLoaiXacThuc(),
            const ChupCCCDMatTruoc(),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.amber,
            ),
          ]),
    );
  }
}
