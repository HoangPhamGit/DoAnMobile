import 'package:app/screens/buy_phone_card/modules/buy_card_changenotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class SoLuongThe extends StatefulWidget {
  const SoLuongThe({super.key});

  @override
  State<SoLuongThe> createState() => _SoLuongTheState();
}

class _SoLuongTheState extends State<SoLuongThe> {
  late BuyPhoneCardChangenotifier notifier = BuyPhoneCardChangenotifier();

  @override
  void initState() {
    notifier = Provider.of<BuyPhoneCardChangenotifier>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104,
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Provider.of<BuyPhoneCardChangenotifier>(context, listen: false)
                  .giamSL();
            },
            child: Selector<BuyPhoneCardChangenotifier, int>(
              selector: (p0, p1) => p1.soLuongThe,
              shouldRebuild: (previous, next) => true,
              builder: (context, value, child) {
                return Container(
                  width: 23.33,
                  height: 23.33,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: notifier.soLuongThe > 1
                          ? const Color(0xff1658E4)
                          : const Color(0xffC1C4D6)),
                  child: const Icon(
                    Icons.remove,
                    size: 20,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          Selector<BuyPhoneCardChangenotifier, int>(
            selector: (p0, p1) => p1.soLuongThe,
            shouldRebuild: (previous, next) => true,
            builder: (context, value, child) {
              return Text(
                '$value',
                style: ThemeProvider.themeOf(context)
                    .data
                    .textTheme
                    .titleMedium!
                    .copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff030E26)),
              );
            },
          ),
          InkWell(
            onTap: () {
              Provider.of<BuyPhoneCardChangenotifier>(context, listen: false)
                  .tangSL();
            },
            child: Container(
              width: 23.33,
              height: 23.33,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xff1658E4)),
              child: const Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
