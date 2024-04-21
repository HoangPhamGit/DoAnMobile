import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class FssTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChange;
  final String? hintText;
  final BorderRadius? borderRadius;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final InputBorder? border;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  const FssTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.textInputType,
    this.onFieldSubmitted,
    this.hintText,
    this.validator,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.onChange,
    this.obscureText,
    this.border,
    this.textStyle,
    this.padding,
  });

  @override
  State<FssTextField> createState() => _FssTextFieldState();
}

class _FssTextFieldState extends State<FssTextField> {
  String? text;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlign: TextAlign.start,
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType ?? TextInputType.text,
      onFieldSubmitted: widget.onFieldSubmitted,
      cursorColor: ThemeProvider.themeOf(context).data.highlightColor,
      onChanged: widget.onChange ??
          (value) {
            setState(() {
              text = value;

              if (value.isNotEmpty) {
              } else {}
            });
          },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: widget.padding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: ThemeProvider.themeOf(context)
            .data
            .textTheme
            .bodySmall!
            .copyWith(
              color: const Color.fromARGB(255, 192, 186, 186).withOpacity(0.7),
            ),
        border: widget.border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromRGBO(230, 230, 230, 1),
                width: 1,
              ),
            ),
        enabledBorder: widget.border ??
            OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromRGBO(230, 230, 230, 1),
                width: 1,
              ),
            ),
        focusedBorder: widget.border ??
            OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromRGBO(230, 230, 230, 1),
                width: 1,
              ),
            ),
      ),
      style: widget.textStyle ??
          ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.black),
      obscureText: widget.obscureText ?? false,
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}
