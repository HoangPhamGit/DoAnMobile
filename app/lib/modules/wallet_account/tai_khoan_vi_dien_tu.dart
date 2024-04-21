import 'package:app/modules/wallet_account/notifier/waller_account_change_notifier.dart';
import 'package:app/modules/wallet_account/pages/han_muc_su_dung_page.dart';
import 'package:app/modules/wallet_account/pages/so_du_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class TaiKhoanViDienTu extends StatefulWidget {
  const TaiKhoanViDienTu({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => WalletAccountChangeNotifier(),
      child: const TaiKhoanViDienTu(),
    );
  }

  @override
  State<TaiKhoanViDienTu> createState() => _TaiKhoanViDienTuState();
}

class _TaiKhoanViDienTuState extends State<TaiKhoanViDienTu>
    with SingleTickerProviderStateMixin {
  late WalletAccountChangeNotifier _notifier;
  @override
  void initState() {
    super.initState();
    _notifier = context.read<WalletAccountChangeNotifier>();
    _notifier.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: const Color.fromRGBO(22, 88, 228, 1),
            title: Text(
              "Tài khoản ví điện tử",
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: Colors.white,
                )),
          ),
          body: Stack(
            children: [
              const TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [SoDuPage(), HanMucSuDungPage()]),
              Positioned(
                bottom: 31,
                left: 24,
                child: Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 48,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: TabBar(
                      indicator: BoxDecoration(
                        color: const Color.fromRGBO(22, 88, 228, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      unselectedLabelColor:
                          const Color.fromRGBO(3, 14, 38, 0.4),
                      unselectedLabelStyle: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .bodySmall!
                          .copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      labelColor: Colors.white,
                      labelStyle: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .bodySmall!
                          .copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      tabs: const [Text('Số dư'), Text('Hạn mức sử dụng')]),
                ),
              ),
            ],
          )),
    );
  }
}
