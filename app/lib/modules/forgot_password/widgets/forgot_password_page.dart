import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String title;
  final String textBottomTitle;
  final bool? password;
  final Widget textField;
  final Widget? textField2;

  const ForgotPasswordPage(
      {super.key,
      required this.title,
      required this.textBottomTitle,
      this.password,
      required this.textField,
      this.textField2});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.title,
          style: ThemeProvider.themeOf(context)
              .data
              .textTheme
              .titleMedium!
              .copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(3, 14, 38, 1)),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        padding: const EdgeInsets.only(
          top: 16,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.textBottomTitle,
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(3, 14, 38, 0.7)),
            ),
            const SizedBox(
              height: 16,
            ),
            widget.textField, //note,
            const SizedBox(
              height: 16,
            ),
            widget.password ?? false ? widget.textField2! : Container(),
            const SizedBox(
              height: 16,
            ),
            // Form(
            //   key: Provider.of<EnterPhoneNumberChangNotifier>(context,
            //           listen: false)
            //       .formKey,
            //   child: Column(
            //     children: [
            //       FssTextField(
            //         controller: Provider.of<EnterPhoneNumberChangNotifier>(
            //                 context,
            //                 listen: false)
            //             .phoneNumberController,
            //         validator: (value) {
            //           return Provider.of<EnterPhoneNumberChangNotifier>(context,
            //                   listen: false)
            //               .checkPhoneNumber();
            //         },
            //       ),
            //       ElevatedButton(
            //         onPressed: () {
            //           Provider.of<EnterPhoneNumberChangNotifier>(context,
            //                   listen: false)
            //               .loadForgot(
            //                   Provider.of<EnterPhoneNumberChangNotifier>(
            //                           context,
            //                           listen: false)
            //                       .phoneNumber);
            //         },
            //         child: Text('Test'),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
