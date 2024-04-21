import 'package:app/modules/register/notifiers/phone_number_registration_change_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:theme_provider/theme_provider.dart';

// class BuildOtpCode extends StatefulWidget {
//   final String phoneNumber;
//   const BuildOtpCode({
//     super.key,
//     required this.phoneNumber,
//   });
//   @override
//   State<BuildOtpCode> createState() => _BuildOtpCodeState();
// }

// class _BuildOtpCodeState extends State<BuildOtpCode> {
//   late final TextEditingController textController;
//   late StreamController<ErrorAnimationType>? errorController;
//   PhoneNumberRegistrationChangeNotifier phoneNotifier =
//       PhoneNumberRegistrationChangeNotifier();
//   RegisterChangeNotifier registerNotifier = RegisterChangeNotifier();
//   final formKey = GlobalKey<FormState>();
//   int time = 20;
//   late Timer countdownTimer;
//   @override
//   void initState() {
//     super.initState();

//     _startTime();

//     textController = TextEditingController();
//     errorController = StreamController<ErrorAnimationType>();
//   }

//   @override
//   void dispose() {
//     textController.dispose();
//     errorController!.close();
//     super.dispose();
//   }

//   _startTime() {
//     print(phoneNotifier.phoneNumber);
//     countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         time = time - 1;
//       });
//       if (time < 1) {
//         countdownTimer.cancel();
//       }
//     });
//   }

//   stopTime() {
//     if (countdownTimer.isActive) {
//       countdownTimer.cancel();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           Container(
//             width: 40,
//             height: 4,
//             color: const Color.fromRGBO(216, 218, 229, 1),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           Text(
//             'register.otp'.tr(),
//             style: ThemeProvider.themeOf(context)
//                 .data
//                 .textTheme
//                 .headlineLarge!
//                 .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Text(
//             'register.enter-otp-validation'.tr(),
//             style: ThemeProvider.themeOf(context)
//                 .data
//                 .textTheme
//                 .bodySmall!
//                 .copyWith(
//                     fontWeight: FontWeight.w400,
//                     color: const Color.fromRGBO(3, 14, 38, 0.7)),
//           ),
//           Text(
//             phoneNotifier.phoneNumber ?? '123123',
//             style: ThemeProvider.themeOf(context)
//                 .data
//                 .textTheme
//                 .bodySmall!
//                 .copyWith(
//                     fontWeight: FontWeight.w400,
//                     color: const Color.fromRGBO(3, 14, 38, 0.7)),
//           ),
//           const SizedBox(
//             height: 32,
//           ),
//           Form(
//             key: formKey,
//             child: PinCodeTextField(
//               appContext: context,
//               length: 6,
//               onCompleted: (value) {},
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               textStyle: ThemeProvider.themeOf(context)
//                   .data
//                   .textTheme
//                   .titleLarge!
//                   .copyWith(
//                       fontWeight: FontWeight.w700,
//                       color: const Color.fromRGBO(3, 14, 38, 1)),
//               pastedTextStyle: ThemeProvider.themeOf(context)
//                   .data
//                   .textTheme
//                   .titleLarge!
//                   .copyWith(
//                       fontWeight: FontWeight.w700,
//                       color: const Color.fromRGBO(3, 14, 38, 1)),
//               autoFocus: true,
//               keyboardType: TextInputType.number,
//               pinTheme: PinTheme(
//                   shape: PinCodeFieldShape.box,
//                   borderRadius: BorderRadius.circular(8),
//                   fieldHeight: 56,
//                   fieldWidth: 50.5,
//                   activeFillColor: const Color.fromRGBO(246, 246, 247, 1),
//                   selectedColor: const Color.fromRGBO(246, 246, 247, 1),
//                   activeColor: const Color.fromRGBO(246, 246, 247, 1),
//                   inactiveColor: const Color.fromRGBO(246, 246, 247, 1)),
//             ),
//           ),
//           const SizedBox(
//             height: 24,
//           ),
//           InkWell(
//             onTap: () {},
//             child: Text(
//               'register.resend-otp'.tr(),
//               style: ThemeProvider.themeOf(context)
//                   .data
//                   .textTheme
//                   .bodyMedium!
//                   .copyWith(
//                       fontWeight: FontWeight.w600,
//                       color: time > 0
//                           ? const Color.fromRGBO(3, 14, 38, 0.4)
//                           : const Color.fromRGBO(22, 88, 228, 1)),
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Text(
//             '(${time}s)',
//             style: ThemeProvider.themeOf(context)
//                 .data
//                 .textTheme
//                 .bodySmall!
//                 .copyWith(
//                     fontWeight: FontWeight.w400,
//                     color: time == 0
//                         ? const Color.fromRGBO(3, 14, 38, 0.4)
//                         : const Color.fromRGBO(22, 88, 228, 1)),
//           )
//         ],
//       ),
//     );
//   }
// }

Widget buildOTp(BuildContext context, int time, String phoneNumber,
    PhoneNumberRegistrationChangeNotifier provider) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Container(
          width: 40,
          height: 4,
          color: const Color.fromRGBO(216, 218, 229, 1),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'register.otp'.tr(),
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'register.enter-otp-validation'.tr(),
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .bodySmall!
              .copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(3, 14, 38, 0.7)),
        ),
        Text(
          provider.phoneNumber ?? '',
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .bodySmall!
              .copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(3, 14, 38, 0.7)),
        ),
        const SizedBox(
          height: 32,
        ),
        Form(
            child: PinCodeTextField(
          appContext: context,
          length: 6,
          onCompleted: (value) {
            provider.confirmOTP(phoneNumber).then((value) {
              provider.isDone = true;
              Navigator.of(context).pop();
            });
          },
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textStyle: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleLarge!
              .copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(3, 14, 38, 1)),
          pastedTextStyle: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleLarge!
              .copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(3, 14, 38, 1)),
          autoFocus: true,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 56,
              fieldWidth: 50.5,
              activeFillColor: const Color.fromRGBO(246, 246, 247, 1),
              selectedColor: const Color.fromRGBO(246, 246, 247, 1),
              activeColor: const Color.fromRGBO(246, 246, 247, 1),
              inactiveColor: const Color.fromRGBO(246, 246, 247, 1)),
        )),
        const SizedBox(
          height: 24,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'register.resend-otp'.tr(),
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .bodyMedium!
                .copyWith(
                    fontWeight: FontWeight.w600,
                    color: time > 0
                        ? const Color.fromRGBO(3, 14, 38, 0.4)
                        : const Color.fromRGBO(22, 88, 228, 1)),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '(${time}s)',
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .bodySmall!
              .copyWith(
                  fontWeight: FontWeight.w400,
                  color: time == 0
                      ? const Color.fromRGBO(3, 14, 38, 0.4)
                      : const Color.fromRGBO(22, 88, 228, 1)),
        )
      ],
    ),
  );
}
