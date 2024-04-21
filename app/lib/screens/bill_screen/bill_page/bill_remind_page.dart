import 'package:app/components/components.dart';
import 'package:app/screens/bill_screen/bill_page/service_select.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BillRemindPage extends StatefulWidget {
  final String? titleContent;
  final String? titleButton;
  final bool? isPayAuto;
  const BillRemindPage(
      {super.key, this.titleContent, this.titleButton, this.isPayAuto = false});

  @override
  State<BillRemindPage> createState() => _BillRemindPageState();
}

class _BillRemindPageState extends State<BillRemindPage> {
  late LoadingTextButtonController buttonController =
      LoadingTextButtonController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 24, left: 24, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 92, left: 53.5),
                width: 220,
                height: 160,
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    left: 30,
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFEAECF0)),
                    ),
                  ),
                  Positioned(
                      top: 12,
                      left: 11.44,
                      child: Container(
                        width: 196.56,
                        height: 114.44,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/paper.png'),
                              fit: BoxFit.cover),
                        ),
                      )),
                  Positioned(
                    top: 70,
                    left: 88,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                            color: Color(0xff1658E4), shape: BoxShape.circle),
                        child: Image.asset(
                          'assets/images/ic_add.png',
                          width: 18,
                          height: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 262,
                height: 76,
                margin: const EdgeInsets.only(left: 32.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'bill-management.no-have-bill'.tr(),
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              color: const Color(
                                0xff030E26,
                              ),
                              fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.titleContent ?? '',
                      textAlign: TextAlign.center,
                      style: ThemeProvider.themeOf(context)
                          .data
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: const Color(
                                0xff030E26,
                              ).withOpacity(0.7),
                              fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48,
            child: LoadingTextButton(
              controller: buttonController,
              onPressed: () {
                setState(() {
                  if (widget.isPayAuto ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectService(
                          showCard: true,
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectService(),
                      ),
                    );
                  }
                });
              },
              borderRadius: BorderRadius.circular(8),
              textStyle: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleSmall!
                  .copyWith(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
              title: widget.titleButton ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
