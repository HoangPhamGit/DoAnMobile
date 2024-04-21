import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
BuildContext? get navigatorContext => navigatorKey.currentContext;

late final List<CameraDescription> cameras;
