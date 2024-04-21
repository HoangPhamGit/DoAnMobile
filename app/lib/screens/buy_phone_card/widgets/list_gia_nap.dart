import 'package:app/screens/buy_phone_card/modules/buy_card_changenotifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class ListGiaNap extends StatefulWidget {
  final String? title;
  const ListGiaNap({super.key, this.title});

  @override
  State<ListGiaNap> createState() => _ListGiaNapState();
}

class _ListGiaNapState extends State<ListGiaNap> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title ?? '',
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleSmall!
              .copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xff030e26),
              ),
        ),
        const SizedBox(
          height: 8,
        ),
        Selector<BuyPhoneCardChangenotifier, List<double>>(
          selector: (p0, p1) => p1.giaMenh,
          shouldRebuild: (previous, next) => true,
          builder: (context, value, child) {
            return SizedBox(
              height: 104,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 50,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        Provider.of<BuyPhoneCardChangenotifier>(context,
                                listen: false)
                            .choseMenhGia(value[index]);
                        // giaNap = menhGia[index];
                        // tamTinh = soLuongThe.toDouble() * giaNap;
                        // print(tamTinh);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: selectedIndex == index
                                  ? const Color(0xff1658E4)
                                  : const Color(0xffE6E6E6),
                              width: 1)),
                      child: Text(
                        '${NumberFormat("#,##0.###").format(value[index])} đ',
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              fontWeight: FontWeight.w600,
                              color: selectedIndex == index
                                  ? const Color(0xff1658E4)
                                  : const Color(0xff030E26).withOpacity(0.7),
                            ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
