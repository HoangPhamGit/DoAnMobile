import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:theme_provider/theme_provider.dart';
import '../widgets/dialog/base_dialog.dart';

class AppErrorCode {
  static const String socketException = "C01";
  static const String httpException = "C02";
  static const String handshakeException = "C03";
  static const String formatException = "C04";
  static const String unknowException = "C05";
}

class MessageManager {
  static Future<void> onErrorDialog(BuildContext context, Object? exception,
      {Function? onRetry}) async {
    String message = "";
    String? exMessage = "";
    RequestOptions? requestOptions;
    if (exception is ApiException) {
      requestOptions ??=
          (exception.response?.requestOptions ?? exception.requestOptions);
      message = exception.errorMessage ??
          "[${exception.errorCode}] ${"base.error-occurred".tr()}";
      if (exception.response?.data != null && exception.errorMessage == "") {
        message = "base.error.err-base".tr();
      }
      if (exception.response != null) {
        exMessage = "${exception.response!.requestOptions.uri}\r\n$exception";
      }
    } else if (exception is DioError) {
      DioError e = exception;
      requestOptions ??= (e.response?.requestOptions ?? e.requestOptions);
      exMessage = '$e\n${e.requestOptions.uri}';
      if (e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectTimeout) {
        message = 'base.error.request-timeout'.tr();
      } else if (e.response != null) {
        message = "${"base.error.err-base".tr()} [${e.response!.statusCode}]";
        if (e.response!.statusCode == 401) {
          message = 'base.error.end-session'.tr();
        } else if (e.response!.statusCode == 403) {
          message = 'base.error.err-403'.tr();
        } else if (e.response!.statusCode == 502 ||
            e.response!.statusCode == 503) {
          message =
              '${'base.error.socket-exception'.tr()} [${e.response!.statusCode}]';
        }
      } else if (e.type == DioErrorType.other) {
        message = 'base.error.err-connect-server'.tr();
        if (e.error is SocketException) {
          message = "[${AppErrorCode.socketException}] $message";
        } else if (e.error is HttpException) {
          message = "[${AppErrorCode.httpException}] $message";
        } else if (e.error is HandshakeException) {
          message = "[${AppErrorCode.handshakeException}] $message";
        } else if (e.error is FormatException) {
          message = "[${AppErrorCode.formatException}] $message";
        } else if (e.error is CertificateCouldNotBeVerifiedException) {
          CertificateCouldNotBeVerifiedException error =
              e.error as CertificateCouldNotBeVerifiedException;
          if (error.innerException is PlatformException) {
            PlatformException innerException =
                error.innerException as PlatformException;
            message = "${innerException.message}";
          } else {
            message = "[${e.error.runtimeType}] $message";
          }
        } else {
          message = "[${e.error.runtimeType}] $message";
        }
      } else {
        message = 'base.error.err-connect-server'.tr();
      }
    } else if (exception is String) {
    } else if (exception is PlatformException) {
      message = '${'base.error.err-connect-server'.tr()}.';
    }
    if (message.isEmpty) return;

    await showAnimatedDialog(
      barrierDismissible: false,
      context: context,
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
      builder: (BuildContext context) {
        return _ExceptionDialog(
          content: message,
          exMessage: exMessage,
          onRetry: onRetry,
          title: 'notification.title'.tr(),
        );
      },
    );
  }

  static Future<void> showMessage(BuildContext context, String? message,
      {bool success = true, Function? onFinished}) async {
    //String title = success ? "base.notification".tr() : "base.error-occurred".tr();
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return _ExceptionDialog(
          title: "",
          content: message,
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
    ).then((_) {
      if (onFinished != null) onFinished();
    });
  }
}

class _ExceptionDialog extends StatefulWidget {
  final String? title;
  final String? content;
  final String? exMessage;
  final Function? onRetry;
  const _ExceptionDialog({
    required this.title,
    required this.content,
    this.exMessage,
    this.onRetry,
  });

  @override
  _InfoDialogState createState() => _InfoDialogState();
}

class _InfoDialogState extends State<_ExceptionDialog> {
  int countLogShow = 0;
  bool isShowMessageEx = false;
  bool isShowTrackLogId = false;
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: InkWell(
        onLongPress: () {
          setState(() {
            if (widget.exMessage != null && widget.exMessage!.isNotEmpty) {
              isShowMessageEx = true;
            }
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if ((widget.title ?? '').isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            widget.title ?? '',
                            style: ThemeProvider.themeOf(context)
                                .data
                                .textTheme
                                .titleLarge,
                          ),
                        ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 16, left: 8, right: 8),
                        child: Text(
                          widget.content!,
                          style: ThemeProvider.themeOf(context)
                              .data
                              .textTheme
                              .bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 8, right: 8),
                        child: Row(
                          children: [
                            (widget.onRetry == null)
                                ? Expanded(
                                    child: BaseDialog.buildActionButton(
                                      text: "base.close".tr(),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        color: ThemeProvider.themeOf(context)
                                            .data
                                            .primaryColor,
                                      ),
                                      onPressed: () {
                                        BaseDialog.closePopup(context);
                                      },
                                    ),
                                  )
                                : Expanded(
                                    child: BaseDialog.buildActionButton(
                                      text: "base.retry".tr(),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        color: ThemeProvider.themeOf(context)
                                            .data
                                            .primaryColor,
                                      ),
                                      onPressed: () {
                                        BaseDialog.closePopup(context);
                                        if (widget.onRetry != null) {
                                          widget.onRetry!();
                                        }
                                      },
                                    ),
                                  ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
