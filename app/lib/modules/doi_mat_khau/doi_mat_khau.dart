import 'package:app/components/components.dart';
import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class DoiMatKhau extends StatelessWidget {
  const DoiMatKhau({super.key});
  static Widget create() {
    return const DoiMatKhau();
  }

  @override
  Widget build(BuildContext context) {
    LoadingTextButtonController btncontroller = LoadingTextButtonController();

    TextEditingController newPass = TextEditingController();
    TextEditingController newPassReEnter = TextEditingController();

    TextEditingController test = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.5,
          title: Text(
            'Đổi mật khẩu',
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 24),
          child: Column(
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
              const FssTextField(
                hintText: 'Mật khẩu cũ',
              ),
              const SizedBox(
                height: 16,
              ),
              FssTextField(
                controller: newPass,
                hintText: 'Mật khẩu mới',
                validator: (p0) {
                  if (newPass.text.isEmpty) {
                    return 'Nhập mật khẩu mới';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              FssTextField(
                controller: newPassReEnter,
                hintText: 'Nhập lại mật khẩu mới',
                validator: (p0) {
                  if (newPassReEnter.text != newPass.text) {
                    return 'Mật khẩu không trùng';
                  }
                  return null;
                },
              ),
              const Spacer(),
              LoadingTextButton(
                  controller: btncontroller,
                  onPressed: () {},
                  title: 'Tiếp theo'),
            ],
          ),
        ));
  }
}
