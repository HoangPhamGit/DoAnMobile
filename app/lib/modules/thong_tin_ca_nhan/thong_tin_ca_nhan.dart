import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/modules/thong_tin_ca_nhan/tt_ca_nhan_change_notifier.dart';
import 'package:app/modules/thong_tin_ca_nhan/widgets/doi_dia_chi_bottom_sheet.dart';
import 'package:app/modules/thong_tin_ca_nhan/widgets/doi_nghe_nghiep_bottom_sheet.dart';
import 'package:app/modules/thong_tin_ca_nhan/widgets/giay_to_tuy_than.dart';
import 'package:app/modules/thong_tin_ca_nhan/widgets/thay_anh_bottom_sheet.dart';
import 'package:app/modules/thong_tin_ca_nhan/widgets/thay_thong_tin_ca_nhan_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class ThongTinCaNhan extends StatefulWidget {
  const ThongTinCaNhan({super.key});
  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => TTCaNhanChangeNotifier(),
      child: const ThongTinCaNhan(),
    );
  }

  @override
  State<ThongTinCaNhan> createState() => _ThongTinCaNhanState();
}

class _ThongTinCaNhanState extends State<ThongTinCaNhan> {
  LoadingTextButtonController btnController = LoadingTextButtonController();
  bool isChange = false;
  TTCaNhanChangeNotifier _notifier = TTCaNhanChangeNotifier();
  @override
  void initState() {
    _notifier = context.read<TTCaNhanChangeNotifier>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: Text(
            'account-info.title.account-info'.tr(),
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .titleMedium!
                .copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(34, 14, 38, 1)),
          ),
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
            padding:
                const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'account-info.title.infomation'.tr(),
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodySmall!
                      .copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(22, 88, 228, 1)),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Image.asset(
                            'assets/images/avt_2.png',
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                          GestureDetector(
                            onTap: () {
                              // showCupertinoModalPopup(
                              //     context: context,
                              //     builder: buildThayAnhActionSheet);

                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  isDismissible: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(24))),
                                  builder: (context) {
                                    return FractionallySizedBox(
                                        heightFactor: 0.32,
                                        child:
                                            buildThayAnhBottomSheet(context));
                                  });
                            },
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(22, 88, 228, 1)),
                              child: const Icon(
                                Icons.file_upload_outlined,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('UserName',
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(3, 14, 38, 0.4))),
                        const Text('Nguyen Văn A'),
                        const SizedBox(
                          height: 8,
                        ),
                        Text('SDT',
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(3, 14, 38, 0.4))),
                        const Text('12332112'),
                      ],
                    )
                  ],
                ),
                buildAccountInforIem(
                    context: context,
                    type: 'email',
                    title: 'account-info.row-label.email'.tr(),
                    content: 'thanhxuan@gmail.com',
                    btnController: btnController,
                    isAutho: true,
                    isChange: true),
                buildAccountInforIem(
                    context: context,
                    type: 'address',
                    title: 'account-info.row-label.address'.tr(),
                    content: 'Truong chinh, thanh xuan, ha noi',
                    btnController: btnController,
                    isChange: true),
                buildAccountInforIem(
                    context: context,
                    title: 'account-info.row-label.job'.tr(),
                    type: 'job',
                    content: 'Nhan vien van phong',
                    btnController: btnController,
                    isChange: true),
                const SizedBox(
                  height: 16,
                ),
                buildThongTinGTTT(context),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildThongTinGTTT(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'account-info.title.identification'.tr(),
        style: ThemeProvider.themeOf(context)
            .data
            .textTheme
            .bodySmall!
            .copyWith(
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(22, 88, 228, 1)),
      ),
      const SizedBox(
        height: 16,
      ),
      const GiayToTuyThan(),
      // buildAccountInforIem(
      //     context: context,
      //     title: 'account-info.row-label.paper-type'.tr(),
      //     content: 'Can cuoc cong dan',
      //     isChange: false),
      // buildAccountInforIem(
      //     context: context,
      //     title: 'account-info.row-label.cccd-number'.tr(),
      //     content: '**********789',
      //     isChange: false),
      // buildAccountInforIem(
      //     context: context,
      //     title: 'account-info.row-label.ngay-cap'.tr(),
      //     content: '22/05/2020',
      //     isChange: false),
      // buildAccountInforIem(
      //     context: context,
      //     title: 'account-info.row-label.noi-cap'.tr(),
      //     content: 'TP Ha Noi',
      //     isChange: false),
      // buildAccountInforIem(
      //     context: context,
      //     title: 'account-info.row-label.quoc-tich'.tr(),
      //     content: 'Viet Nam,',
      //     isChange: false),
      // buildAccountInforIem(
      //     context: context,
      //     title: 'account-info.row-label.dc-thuong-chu'.tr(),
      //     content: 'TP Ha noi',
      //     isChange: false),
      // buildAccountInforIem(
      //     context: context,
      //     title: 'account-info.row-label.ngay-het-han'.tr(),
      //     content: '22/05/2040',
      //     isChange: false),
    ],
  );
}

Widget buildAccountInforIem(
    {required BuildContext context,
    required String title,
    required content,
    required String type,
    LoadingTextButtonController? btnController,
    bool? isAutho,
    required bool isChange}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Divider(
        height: 32,
        thickness: 1,
        color: Color.fromRGBO(3, 14, 38, 0.05),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Row(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: ThemeProvider.themeOf(context)
                      .data
                      .textTheme
                      .bodySmall!
                      .copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(3, 14, 38, 0.4)),
                ),
                const SizedBox(
                  width: 8,
                ),
                isAutho ?? false
                    ? Icon(
                        Icons.info_outlined,
                        size: 24,
                        color: Colors.amber.shade400,
                      )
                    : Container(),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              content,
              textAlign: TextAlign.start,
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodySmall!
                  .copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(3, 14, 38, 1)),
            ),
          ),
          isChange
              ? Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      switch (type) {
                        case 'email':
                          showButtonSheet(
                            context: context,
                            size: 0.65,
                            botsheet: buildThayThongTinSheet(
                                context, title, btnController!),
                          );
                          break;
                        case 'address':
                          showButtonSheet(
                            context: context,
                            size: 0.7,
                            botsheet: const DiaChiChange(),
                          );
                          break;
                        case 'job':
                          showButtonSheet(
                            context: context,
                            size: 0.4,
                            botsheet: const NgheNghiepChange(),
                          );
                          break;
                        default:
                          break;
                      }
                    },
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        'assets/images/svg/change_info_account.svg',
                        height: 24,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      )
    ],
  );
}

Future<void> showButtonSheet({
  required BuildContext context,
  required double size,
  required Widget botsheet,
}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: size,
          child: botsheet,
        );
      });
}
