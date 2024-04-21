import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:theme_provider/theme_provider.dart';

enum ButtonState { idle, lock, loading, success, error }

enum LoadingPosition { middleWithOverlay, locatedInButton }

class LoadingTextButton extends StatefulWidget {
  final LoadingTextButtonController controller;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final String title;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double height;
  final bool enabled;
  final Widget? icon;

  ///true: Tu dong hien thi loading
  final bool animateOnTap;
  final Color valueColor;
  final bool resetAfterDuration;
  final bool hasBackgroundImage;
  final LoadingPosition? loadingPosition;

  const LoadingTextButton({
    Key? key,
    required this.controller,
    required this.onPressed,
    this.backgroundColor,
    required this.title,
    this.textStyle,
    this.height = 44,
    this.animateOnTap = false,
    this.valueColor = Colors.white,
    this.borderRadius,
    this.borderColor,
    this.resetAfterDuration = false,
    this.hasBackgroundImage = true,
    this.loadingPosition = LoadingPosition.locatedInButton,
    this.enabled = true,
    this.icon,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoadingTextButtonState();
}

class LoadingTextButtonState extends State<LoadingTextButton>
    with TickerProviderStateMixin {
  late AnimationController _buttonController;
  late Animation _squeezeAnimation;
  final _state = BehaviorSubject<ButtonState>.seeded(ButtonState.idle);

  @override
  Widget build(BuildContext context) {
    // Widget _loader = Container(
    //   width: (widget.height < 40) ? 20 : 27,
    //   height: (widget.height < 40) ? 20 : 27,
    //   child: CircularProgressIndicator(
    //     strokeWidth: 3,
    //     valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
    //   ),
    // );

    Widget loader = const SizedBox(
      height: 20,
      width: 20,
      child: LoadingIndicator(
        indicatorType: Indicator.lineSpinFadeLoader,
        colors: [
          Colors.white,
        ],
      ),
    );

    Widget locker = const SizedBox(
        height: 18,
        width: 18,
        child: Icon(
          Icons.lock_outline,
          color: Colors.white38,
          size: 18,
        ));

    final btn = StreamBuilder(
        stream: _state,
        builder: (context, snapshot) {
          return ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
                // borderRadius: BorderRadius.circular(this.widget.borderRadius),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      // padding: MaterialStateProperty.all(
                      //   EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      // ),
                      backgroundColor: MaterialStateProperty.all(
                        widget.enabled
                            ? widget.backgroundColor ??
                                ThemeProvider.themeOf(context).data.primaryColor
                            : widget.backgroundColor ??
                                ThemeProvider.themeOf(context)
                                    .data
                                    .disabledColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              widget.borderRadius ?? BorderRadius.circular(4),
                          side: BorderSide(
                            color: widget.borderColor ?? Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                    onPressed: _btnPressed,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 10),
                      // child: SizedBox(
                      //   width: double.infinity,
                      //   child: Stack(
                      //     children: [
                      //       (snapshot.data == ButtonState.loading)
                      //           ? Center(
                      //               child: _loader,
                      //             )
                      //           : Center(
                      //               child: Text(
                      //                 widget.title,
                      //                 style: this.widget.textStyle,
                      //               ),
                      //             ),
                      //     ],
                      //   ),
                      // )

                      child: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  widget.icon ?? Container(),
                                  Text(
                                    widget.title,
                                    style: (widget.textStyle ??
                                            ThemeProvider.themeOf(context)
                                                .data
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.white))
                                        .copyWith(
                                            color: snapshot.data ==
                                                    ButtonState.loading
                                                ? Colors.grey.shade300
                                                : null),
                                  ),
                                ],
                              ),
                            ),
                            if (snapshot.data == ButtonState.loading &&
                                widget.loadingPosition ==
                                    LoadingPosition.locatedInButton)
                              Positioned(
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: loader,
                              ),
                            if (snapshot.data == ButtonState.lock &&
                                widget.loadingPosition ==
                                    LoadingPosition.locatedInButton)
                              Positioned(
                                right: 10,
                                top: 0,
                                bottom: 0,
                                child: locker,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });

    return SizedBox(
      height: widget.height,
      child: btn,
    );
  }

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
        duration: const Duration(milliseconds: 0), vsync: this);

    _squeezeAnimation = Tween<double>(begin: 300, end: 50).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.easeInOutCirc,
      ),
    );

    _squeezeAnimation.addListener(() {
      setState(() {});
    });

    _squeezeAnimation.addStatusListener((state) {
      if (state == AnimationStatus.completed && widget.animateOnTap) {
        widget.onPressed();
      }
    });

    _state.stream.listen((event) {
      if (!mounted) return;
      widget.controller._state.sink.add(event);
    });

    widget.controller
        ._addListeners(_start, _stop, _success, _error, _reset, _lock);
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _state.close();
    super.dispose();
  }

  void _btnPressed() async {
    if (_state.value == ButtonState.loading ||
        _state.value == ButtonState.lock ||
        !widget.enabled) return;

    if (widget.animateOnTap) {
      _start();
    } else {
      widget.onPressed();
    }
  }

  void _showLoading() {
    if (mounted &&
        widget.loadingPosition == LoadingPosition.middleWithOverlay &&
        _state.value != ButtonState.loading) {
      EasyLoading.show();
    }
  }

  void _hideLoading() {
    if (mounted &&
        widget.loadingPosition == LoadingPosition.middleWithOverlay &&
        _state.value == ButtonState.loading) {
      EasyLoading.dismiss();
    }
  }

  void _start() {
    if (!mounted) return;
    _showLoading();
    _state.sink.add(ButtonState.loading);

    _buttonController.forward();
    if (widget.resetAfterDuration) _reset();
  }

  void _stop() {
    _hideLoading();
    if (!mounted) return;
    _state.sink.add(ButtonState.idle);

    _buttonController.reverse();
  }

  void _success() {
    if (!mounted) return;
    _hideLoading();
    _state.sink.add(ButtonState.success);
    _buttonController.reverse();
  }

  void _error() {
    if (!mounted) return;
    _hideLoading();
    _state.sink.add(ButtonState.error);
    _reset();
  }

  void _reset() async {
    if (!mounted) return;
    _hideLoading();
    _state.sink.add(ButtonState.idle);

    unawaited(_buttonController.reverse());
  }

  void _lock() {
    if (!mounted) return;
    _hideLoading();
    _state.sink.add(ButtonState.lock);
    _buttonController.reverse();
  }
}

class LoadingTextButtonController {
  VoidCallback? _startListener;
  VoidCallback? _stopListener;
  VoidCallback? _successListener;
  VoidCallback? _errorListener;
  VoidCallback? _resetListener;
  VoidCallback? _lockListener;

  void _addListeners(
    VoidCallback startListener,
    VoidCallback stopListener,
    VoidCallback successListener,
    VoidCallback errorListener,
    VoidCallback resetListener,
    VoidCallback lockListener,
  ) {
    _startListener = startListener;
    _stopListener = stopListener;
    _successListener = successListener;
    _errorListener = errorListener;
    _resetListener = resetListener;
    _lockListener = lockListener;
  }

  // ignore: close_sinks
  final BehaviorSubject<ButtonState> _state =
      BehaviorSubject<ButtonState>.seeded(ButtonState.idle);
  Stream<ButtonState> get stateStream => _state.stream;

  ButtonState get currentState => _state.value;

  void start() {
    if (_startListener != null) _startListener!();
  }

  void stop() {
    if (_stopListener != null) _stopListener!();
  }

  void success() {
    if (_successListener != null) _successListener!();
  }

  void error() {
    if (_errorListener != null) _errorListener!();
  }

  void reset() {
    if (_resetListener != null) _resetListener!();
  }

  void lock() {
    if (_lockListener != null) _lockListener!();
  }
}
