import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class UserDanhBa extends StatefulWidget {
  final String? avatar;
  final String? userName;
  final String? phoneNumber;
  const UserDanhBa({super.key, this.avatar, this.userName, this.phoneNumber});

  @override
  State<UserDanhBa> createState() => _UserDanhBaState();
}

class _UserDanhBaState extends State<UserDanhBa> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 42,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(widget.avatar ?? ''),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.userName ?? '',
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff030E26)),
                      ),
                      Text(
                        widget.phoneNumber ?? '',
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .titleSmall!
                            .copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff030E26).withOpacity(0.4),
                            ),
                      ),
                    ],
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 24,
                color: const Color(0xff030E26).withOpacity(0.4),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
