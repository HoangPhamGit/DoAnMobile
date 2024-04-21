import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/modules/register/build_bottom_sheet.dart';
import 'package:app/screens/bill_screen/widgets/bill_confirm_bottom.dart';
import 'package:app/screens/bill_screen/widgets/bill_select_supply.dart';
import 'package:app/screens/bill_screen/widgets/custom_appbar.dart';
import 'package:app/screens/bill_screen/widgets/type_service.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BillInformationPage extends StatefulWidget {
  const BillInformationPage({super.key});
  // static Widget create() {
  //   return MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (context) => BillChangNotifier()),
  //       ChangeNotifierProvider(create: (context) => SupplierChangeNotifier()),
  //     ],
  //     child: const BillInformationPage(),
  //   );
  // }

  @override
  State<BillInformationPage> createState() => _BillInformationPageState();
}

class _BillInformationPageState extends State<BillInformationPage> {
  late TextEditingController controller;

  late LoadingTextButtonController buttonController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? userCode;
  // late SupplierChangeNotifier supplierChangeNotifier;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    buttonController = LoadingTextButtonController();
    // supplierChangeNotifier =
    //     Provider.of<SupplierChangeNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          title: 'bill-management.create-bill-reminder-schedule'.tr()),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
        child: Column(
          children: [
            const TypeService(),
            const SizedBox(
              height: 16,
            ),
            const BillSelectSupply(),
            const SizedBox(
              height: 16,
            ),
            Form(
              key: _formKey,
              child: FssTextField(
                controller: controller,
                hintText: 'bill-management.enter-customer-code'.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'bill-management.error'.tr();
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  userCode = value;
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            LoadingTextButton(
              controller: buttonController,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  buildBottomSheet(
                      context: context,
                      bottomSheet: const BillConfirm(),
                      size: 369 / 812);
                }
              },
              borderRadius: BorderRadius.circular(8),
              title: 'bill-management.continue'.tr(),
              textStyle: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
