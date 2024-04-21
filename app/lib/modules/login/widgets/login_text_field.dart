import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class LoginTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final ValueChanged<String>? onFieldSubmitted;
  final String? hintText;
  final bool? password;
  final Widget? prefixIcon;
  const LoginTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.textInputType,
    this.onFieldSubmitted,
    this.hintText,
    this.password = false,
    this.prefixIcon,
  });

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool showPassword = false;
  String? text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType ?? TextInputType.text,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: (value) {
        setState(() {
          text = value;
        });
      },
      cursorColor: ThemeProvider.themeOf(context).data.highlightColor,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: widget.prefixIcon,
        isDense: true,
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
              ),
            const SizedBox(width: 10),
          ],
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        // focusedBorder: InputBorder.none,
        // enabledBorder: InputBorder.none,
        // errorBorder: InputBorder.none,
        // disabledBorder: InputBorder.none,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintText: widget.hintText,
        hintStyle: ThemeProvider.themeOf(context)
            .data
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black.withOpacity(0.7)),
      ),
      // inputFormatters: [
      //   if (widget.lengthLimitingTextInput != null)
      //     LengthLimitingTextInputFormatter(widget.lengthLimitingTextInput)
      // ],
      style: ThemeProvider.themeOf(context)
          .data
          .textTheme
          .titleSmall!
          .copyWith(color: Colors.black),
      enableSuggestions: false,
      autocorrect: false,
      obscureText: (widget.password ?? false) && !showPassword,
      // onChanged: _onChanged,
    );
  }
}
