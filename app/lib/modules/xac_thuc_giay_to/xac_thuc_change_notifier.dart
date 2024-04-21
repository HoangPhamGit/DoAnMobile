import 'package:app/commons/message_manager.dart';
import 'package:app/components/components.dart';
import 'package:app/configs/routes/app_routes_const.dart';
import 'package:app/modules/xac_thuc_giay_to/notifier/chon_loai_giay_to_change_notitfier.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class XacThucChangeNotifier with ChangeNotifier {
  final LoadingTextButtonController buttonController =
      LoadingTextButtonController();
  late TabController tabController;
  int get index => tabController.index;

  void onNextPage({Function? onStart}) {
    if (index != tabController.length - 1) {
      int nextIndex = index + 1;
      tabController.animateTo(nextIndex);
      notifyListeners();
    } else {
      if (onStart != null) onStart();
    }
  }

  void onPreviousPage() {
    if (index > 0) {
      int prevIndex = index - 1;
      tabController.animateTo(prevIndex);
      notifyListeners();
    }
  }

  KycInitRequest kycInitRequest = KycInitRequest();

  void onSubmit(BuildContext context) {
    switch (index) {
      case 0:
        context
            .read<ChonLoaiGiayToChangeNotifier>()
            .loadKycInit(kycInitRequest)
            .then((value) {
          onNextPage();
        }).onError((error, stackTrace) {
          MessageManager.onErrorDialog(context, error);
        });
        break;
      case 1:

      case 2:
        break;
      default:
        onNextPage(onStart: () {
          Navigator.pushNamed(context, AppRoutesConst.successRegister);
        });
        break;
    }
  }
}
