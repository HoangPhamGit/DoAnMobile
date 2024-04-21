// import 'package:app/components/fss_text_button/loading_text_button.dart';
// import 'package:app/configs/routes/app_routes_const.dart';
// import 'package:app/modules/popup/popup_dialog.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';


// class TestPopup extends StatefulWidget {
//   const TestPopup({super.key});

//   @override
//   State<TestPopup> createState() => _TestPopupState();
// }

// class _TestPopupState extends State<TestPopup> {
//   final LoadingTextButtonController buttonController =
//       LoadingTextButtonController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 100,
//           ),
//           TextButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, AppRoutesConst.taiKhoanVi);
//               },
//               child: const Text('bấm')),
//           TextButton(
//               onPressed: () {
//                 showAnimatedDialog(
//                     context: context,
//                     barrierDismissible: true,
//                     builder: (context) {
//                       return buildPopupDialog(
//                           context: context,
//                           agreeOnPressed: () {
//                             Navigator.pushNamed(
//                                 context, AppRoutesConst.taiKhoanVi);
//                           },
//                           dismissPressed: () {
//                             Navigator.pushNamed(
//                                 context, AppRoutesConst.accountNotification);
//                           },
//                           imgPath: 'assets/images/popup_thanh_toan_hoa_don.jpg',
//                           title: 'popup.title.bill-payment'.tr(),
//                           alertContent:
//                               'Lorem Ipsum is simply dummy text of the printing and typesetting.',
//                           btnController: buttonController,
//                           accepText: 'popup.button.payment'.tr());
//                     },
//                     animationType: DialogTransitionType.size,
//                     curve: Curves.fastOutSlowIn,
//                     duration: const Duration(seconds: 1));
//               },
//               child: const Text('ví điện tử test')),
//           Center(
//               child: TextButton(
//                   onPressed: () {
//                     showAnimatedDialog(
//                         context: context,
//                         barrierDismissible: true,
//                         builder: (context) {
//                           return buildPopupDialog(
//                               context: context,
//                               agreeOnPressed: () {
//                                 Navigator.pushNamed(
//                                     context, AppRoutesConst.qrSacan);
//                               },
//                               dismissPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               imgPath:
//                                   'assets/images/popup_xac_thuc_khach_hang.jpg',
//                               title: 'popup.title.authentication'.tr(),
//                               alertContent:
//                                   'Lorem Ipsum is simply dummy text of the printing and typesetting.',
//                               btnController: buttonController,
//                               accepText: 'popup.button.authentic'.tr());
//                         },
//                         animationType: DialogTransitionType.size,
//                         curve: Curves.fastOutSlowIn,
//                         duration: const Duration(seconds: 1));
//                   },
//                   child: const Text('Show dialog'))),
//         ],
//       ),
//     );
//   }
// }
