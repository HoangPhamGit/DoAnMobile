import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class AccountBalance extends StatefulWidget {
  const AccountBalance({super.key});

  @override
  State<AccountBalance> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  bool selected = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration.zero, () {
        setState(() {
          selected = true;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: selected ? 1 : 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: ThemeProvider.themeOf(context).data.primaryColor,
          border: Border.all(color: Colors.white.withOpacity(0.15)),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text(
                "Số dư: ",
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white.withOpacity(0.4)),
              ),
              Text(
                "12.938.223 ₫",
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.visibility_off_outlined,
                color: Color(0xff4AF1E7),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
