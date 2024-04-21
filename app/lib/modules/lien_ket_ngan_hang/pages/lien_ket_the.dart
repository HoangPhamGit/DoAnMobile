import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/lien_ket_ngan_hang/notifiers/lien_ket_ngan_hang_change_notifier.dart';
import 'package:app/modules/lien_ket_ngan_hang/widgets/lien_ket_func_item.dart';
import 'package:app/widgets/fss_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:theme_provider/theme_provider.dart';

class LienKetTheNH extends StatefulWidget {
  const LienKetTheNH({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => LienKetNHChangeNotifier(),
      child: const LienKetTheNH(),
    );
  }

  @override
  State<LienKetTheNH> createState() => _LienKetTheNHState();
}

class _LienKetTheNHState extends State<LienKetTheNH> {
  late LienKetNHChangeNotifier _notifier;
  @override
  void initState() {
    _notifier = context.read<LienKetNHChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeProvider.themeOf(context).data.primaryColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: ThemeProvider.themeOf(context).data.primaryColor,
          title: Text(
            'link-card.title.lienket-NH'.tr(),
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: Column(
            children: [
              FssSearch(
                hintText: 'link-card.content.tim-kiem'.tr(),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: _notifier.bank.length,
                      itemBuilder: (_, index) {
                        final data = _notifier.bank[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutesConst.nhapThongTinThe);
                          },
                          child: LienKetFuncItem(
                            iconPath: data['logo'] as String,
                            textColor: Colors.black,
                            title: data['name'] as String,
                          ),
                        );
                      }))
            ],
          ),
        ));
  }
}
