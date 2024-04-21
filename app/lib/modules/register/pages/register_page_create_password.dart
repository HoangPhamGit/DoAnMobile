import 'package:app/modules/register/notifiers/create_password_change_notifier.dart';
import 'package:app/modules/register/register_change_notifier.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:app/widgets/scaffold_base.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class RegisterPageCreatePassword extends StatefulWidget {
  const RegisterPageCreatePassword({
    super.key,
  });

  @override
  State<RegisterPageCreatePassword> createState() =>
      _RegisterPageCreatePasswordState();
}

class _RegisterPageCreatePasswordState
    extends State<RegisterPageCreatePassword> {
  late CreatePasswordChangeNotifier _notifier;
  String error = '123123';

  @override
  void initState() {
    _notifier = context.read<CreatePasswordChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      context,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              context.read<RegisterChangeNotifier>().onPreviousPage();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            )),
        title: Text(
          "register.create-password".tr(),
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleMedium!
              .copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(3, 14, 38, 1)),
        ),
      ),
      body: Form(
        key: _notifier.formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.only(
            top: 16,
            left: 24,
            right: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "register.password-require".tr(),
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(3, 14, 38, 0.7)),
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer<CreatePasswordChangeNotifier>(
                builder: (context, provider, child) {
                  return FssTextField(
                      controller: _notifier.passController,
                      hintText: 'register.password'.tr(),
                      validator: (p0) {
                        return _notifier.checkPass();
                      },
                      obscureText: _notifier.isShowPass,
                      suffixIcon: InkWell(
                        onTap: () {
                          _notifier.showPass();
                        },
                        child: provider.isShowPass
                            ? const Icon(
                                Icons.visibility_outlined,
                                size: 24,
                                color: Color.fromRGBO(3, 14, 38, 0.7),
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                size: 24,
                                color: Color.fromRGBO(3, 14, 38, 0.7),
                              ),
                      ));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer<CreatePasswordChangeNotifier>(
                  builder: (context, provider, child) {
                return FssTextField(
                    controller: _notifier.rePassController,
                    hintText: 'register.enter-password'.tr(),
                    validator: (p0) {
                      return _notifier.checkRePass();
                    },
                    obscureText: _notifier.isShowRePass,
                    suffixIcon: InkWell(
                      onTap: () {
                        _notifier.showRepass();
                      },
                      child: provider.isShowRePass
                          ? const Icon(
                              Icons.visibility_outlined,
                              size: 24,
                              color: Color.fromRGBO(3, 14, 38, 0.7),
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              size: 24,
                              color: Color.fromRGBO(3, 14, 38, 0.7),
                            ),
                    ));
              }),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
