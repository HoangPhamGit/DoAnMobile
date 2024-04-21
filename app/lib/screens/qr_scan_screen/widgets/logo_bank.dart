import 'package:flutter/material.dart';

Widget buildBankWidget({required String logoBank}) {
  return Container(
    height: 24,
    padding: const EdgeInsets.only(top: 4, left: 8, bottom: 4, right: 8),
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white),
    child: Image.asset(
      logoBank,
      fit: BoxFit.fitHeight,
    ),
  );
}
