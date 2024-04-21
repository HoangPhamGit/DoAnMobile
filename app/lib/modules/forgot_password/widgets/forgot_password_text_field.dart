import 'package:app/widgets/fss_text_field.dart';

import 'package:flutter/material.dart';

class ForgotPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? password;
  final String? hinText;
  final String? Function(String?)? validator;
  final GlobalKey<FormState>? fomrkey;

  const ForgotPasswordTextField({
    super.key,
    this.controller,
    this.password = false,
    this.hinText,
    this.validator,
    this.fomrkey,
  });

  @override
  State<ForgotPasswordTextField> createState() =>
      _ForgotPasswordTextFieldState();
}

class _ForgotPasswordTextFieldState extends State<ForgotPasswordTextField> {
  String? text;
  bool showPassword = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.fomrkey,
      child: FssTextField(
        validator: widget.validator,
        onChange: (value) {
          setState(() {
            text = value;
          });
        },
        hintText: widget.hinText,
        controller: widget.controller,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if ((text?.isNotEmpty ?? false) && (widget.password ?? false))
              InkWell(
                onTap: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: SizedBox(
                    width: 24,
                    child: Icon(
                      (showPassword)
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 24,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
              )
          ],
        ),
        obscureText: (widget.password ?? false) && !showPassword,
      ),
    );
  }
}
