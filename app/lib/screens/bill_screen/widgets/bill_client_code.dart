import 'package:app/widgets/fss_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BillClientCode extends StatefulWidget {
  final GlobalKey<FormState>? formkey;
  final TextEditingController? controller;
  const BillClientCode({super.key, this.formkey, this.controller});

  @override
  State<BillClientCode> createState() => _BillClientCodeState();
}

class _BillClientCodeState extends State<BillClientCode> {
  String? userCode;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: FssTextField(
        controller: widget.controller,
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
    );
  }
}
