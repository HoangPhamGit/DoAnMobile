import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class RegisterTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final ValueChanged<String>? onFieldSubmitted;
  final String? hintText;
  final bool? password;

  const RegisterTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.textInputType,
    this.onFieldSubmitted,
    this.hintText,
    this.password = false,
  });

  @override
  State<RegisterTextField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  String? text;

  bool showPassword = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType ?? TextInputType.text,
      onFieldSubmitted: widget.onFieldSubmitted,
      cursorColor: ThemeProvider.themeOf(context).data.highlightColor,
      onChanged: (value) {
        setState(() {
          text = value;

          if (value.isNotEmpty) {
          } else {}
        });
      },
      validator: (value) {
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        suffixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
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
        ]),
        // labelText: _labelText,
        // labelStyle: const TextStyle(
        //     fontSize: 12,
        //     fontWeight: FontWeight.w400,
        //     color: Color.fromRGBO(230, 230, 230, 1)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintText: widget.hintText,
        hintStyle: ThemeProvider.themeOf(context)
            .data
            .textTheme
            .bodySmall!
            .copyWith(
              color: const Color.fromARGB(255, 192, 186, 186).withOpacity(0.7),
            ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8),
        //   borderSide: const BorderSide(
        //     color: Color.fromRGBO(230, 230, 230, 1),
        //     width: 0,
        //   ),
        // ),
        border: const OutlineInputBorder(borderSide: BorderSide()),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(230, 230, 230, 1),
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
              color: Color.fromRGBO(230, 230, 230, 1),
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside),
        ),
      ),
      style: ThemeProvider.themeOf(context)
          .data
          .textTheme
          .titleSmall!
          .copyWith(color: Colors.black),
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}
