import 'package:app/commons/message_manager.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

class ChonLoaiGiayToChangeNotifier extends ChangeNotifier {
  KycInitResponse? kycInitResponse;
  KycInitRequest kycInitRequest = KycInitRequest();
  Future<void> loadKycInit(KycInitRequest kyc) async {
    final kycApi = locator<XacThucAPI>();
    var response = await kycApi.kycInit(kyc);

    kycInitResponse = response;
  }

  void onSubmit(BuildContext context,
      {required Function onSuccess, required Function onError}) {
    loadKycInit(kycInitRequest).then((value) {
      onSuccess();
      return;
    }).onError((error, stackTrace) {
      //

      MessageManager.onErrorDialog(context, error);
      return;
    });
  }
}
