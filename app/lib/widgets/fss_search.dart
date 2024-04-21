import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class FssSearch extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final ValueChanged<String>? onFieldSubmitted;
  final String? hintText;
  final String? Function(String?)? validator;
  const FssSearch({
    super.key,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.textInputType,
    this.onFieldSubmitted,
    this.hintText,
    this.validator,
  });

  @override
  State<FssSearch> createState() => _FssSearchState();
}

class _FssSearchState extends State<FssSearch> {
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
      onChanged: (value) {
        setState(() {
          text = value;

          if (value.isNotEmpty) {
          } else {}
        });
      },
      decoration: InputDecoration(
        fillColor: ThemeProvider.themeOf(context).data.colorScheme.background,
        filled: true,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintText: widget.hintText ?? "Từ khoá tìm kiếm",
        hintStyle: ThemeProvider.themeOf(context)
            .data
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black.withOpacity(0.4)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xffE6E6E6),
            width: 1,
          ),
        ),
        prefixIcon: Icon(
          Icons.search_outlined,
          size: 24,
          color:
              ThemeProvider.themeOf(context).data.textTheme.titleLarge?.color,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: ThemeProvider.themeOf(context).data.focusColor,
            width: 1,
          ),
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
