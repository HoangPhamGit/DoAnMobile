import 'package:app/commons/message_manager.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

import '../../../enums/loading_state_enum.dart';

class FavoriteServiceChangeNotifier with ChangeNotifier {
  ListAllServicesResponse? _listAllServicesResponse;
  LoadingStateEnum _loadingState = LoadingStateEnum.initializing;
  LoadingStateEnum get loadingState => _loadingState;
  List<Service> get listAllServices =>
      _listAllServicesResponse?.listAllServices ?? [];

  List<Service> get favouriteServices =>
      _listAllServicesResponse?.favouriteServices ?? [];

  Future<void> loadAllServices(BuildContext context) async {
    _loadingState = LoadingStateEnum.loading;
    notifyListeners();

    locator<ServiceApi>().listAllServices().then((value) async {
      await Future.delayed(const Duration(seconds: 1));
      _loadingState = LoadingStateEnum.loaded;
      _listAllServicesResponse = value;
      notifyListeners();
    }).catchError((exception) {
      _loadingState = LoadingStateEnum.error;
      notifyListeners();
      if (context.mounted) {
        MessageManager.onErrorDialog(context, exception);
      }
    });
  }
}
