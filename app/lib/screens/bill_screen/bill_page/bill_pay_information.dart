import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/screens/bill_screen/widgets/bill_chose_bank.dart';
import 'package:app/screens/bill_screen/widgets/bill_confirm_bank.dart';
import 'package:app/screens/bill_screen/widgets/bill_list_bank_select.dart';
import 'package:app/screens/bill_screen/widgets/bill_select_supply.dart';
import 'package:app/screens/bill_screen/widgets/build_bottom_sheet.dart';
import 'package:app/screens/bill_screen/widgets/custom_appbar.dart';
import 'package:app/screens/bill_screen/widgets/type_service.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BillPayInformation extends StatefulWidget {
  const BillPayInformation({super.key});

  @override
  State<BillPayInformation> createState() => _BillPayInformationState();
}

class _BillPayInformationState extends State<BillPayInformation> {
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
      appBar: CustomAppBar(title: 'bill-management.bill-title'.tr()),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  buildBottomSheet(
                      context: context,
                      bottomSheet: const BillListBank(),
                      size: 462 / 812);
                },
                child: const ChoseBank()),
            const SizedBox(
              height: 16,
            ),
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
                      bottomSheet: const BillConfirmBank(),
                      size: 478 / 812);
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
