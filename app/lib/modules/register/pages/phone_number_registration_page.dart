import 'package:app/modules/register/notifiers/phone_number_registration_change_notifier.dart';
import 'package:app/modules/register/widget/term_service_checkbox.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:app/widgets/scaffold_base.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class PhoneNumberRegistrationPage extends StatefulWidget {
  const PhoneNumberRegistrationPage({super.key});

  @override
  State<PhoneNumberRegistrationPage> createState() =>
      _PhoneNumberRegistrationPageState();
}

class _PhoneNumberRegistrationPageState
    extends State<PhoneNumberRegistrationPage> {
  late PhoneNumberRegistrationChangeNotifier _notifier;
  @override
  void initState() {
    _notifier = context.read<PhoneNumberRegistrationChangeNotifier>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      context,
      backgroundColor:
          ThemeProvider.themeOf(context).data.colorScheme.background,
      titleAppBar: "register.title".tr(),
      // appBar: AppBar(
      //   backgroundColor:
      //       ThemeProvider.themeOf(context).data.colorScheme.background,
      //   centerTitle: true,
      //   leading: InkWell(
      //       onTap: () {
      //         Navigator.of(context).pop();
      //       },
      //       child: const Icon(
      //         Icons.arrow_back,
      //         size: 24,
      //         color: Colors.black,
      //       )),
      //   title: Text(
      //     "register.title".tr(),
      //     style: ThemeProvider.themeOf(context)
      //         .data
      //         .textTheme
      //         .titleMedium!
      //         .copyWith(
      //             fontWeight: FontWeight.w700,
      //             color: const Color.fromRGBO(3, 14, 38, 1)),
      //   ),
      // ),
      body: Form(
        key: _notifier.formKey,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "register.username".tr(),
                style: ThemeProvider.themeOf(context).data.textTheme.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              FssTextField(
                  controller: _notifier.phoneNumberController,
                  hintText: "register.phone-number".tr(),
                  textInputType: const TextInputType.numberWithOptions(),
                  validator: (value) {
                    // if ((_notifier.phoneNumber ?? '').isEmpty) {
                    //   return 'Khong dươc de trong';
                    // }
                    // return null;
                    return _notifier.validatePhoneNumber(context);
                  }),
              const SizedBox(
                height: 16,
              ),
              const BuildTermServiceCheckbox(),
            ],
          ),
        ),
      ),
    );
  }
}
