import 'package:app/commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme_provider/theme_provider.dart';

class AmountInputTextField extends StatefulWidget {
  final TextEditingController controller;
  const AmountInputTextField({super.key, required this.controller});

  @override
  State<AmountInputTextField> createState() => _AmountInputTextFieldState();
}

class _AmountInputTextFieldState extends State<AmountInputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textAlign: TextAlign.center, // Center aligns the text input
      decoration: const InputDecoration(
        border: InputBorder.none, // Removes the border
        hintText: '0đ',
        hintStyle: TextStyle(color: Colors.grey, fontSize: 24),
      ),
      inputFormatters: [
        _UsNumberTextInputFormatter(),
      ],
      style: ThemeProvider.themeOf(context).data.textTheme.titleLarge?.copyWith(
            fontSize: 24,
          ),
    );
  }
}

class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    if (newValue.text.isEmpty) return newValue;
    double value = double.parse(newValue.text.replaceAll(",", ""));

    String newText = NumberFormatter.formatPrice(value);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
