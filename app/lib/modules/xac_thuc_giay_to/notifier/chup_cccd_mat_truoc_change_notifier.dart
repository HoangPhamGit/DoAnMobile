import 'package:app/commons/message_manager.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:data/data.dart';

class ChupCCCDMatTruocChangeNotifier extends ChangeNotifier {
  bool isAuthentication = false;
  bool isSuccess = false;
  bool isFont = false;

  KycUploadResponse? kycFrontResponse;
  Future<void> loadCCCDFront(KycUploadRequest kycUpload) async {
    final kycApi = locator<XacThucAPI>();
    var response = await kycApi.kycUpload(kycUpload);
    print('call api');
    kycFrontResponse = response;
    notifyListeners();
  }

  ImageData? imageData;
  Future<void> addImageData() async {
    // final imagePath = await camController.takePicture();
    String path = "imagePath.path";
    print('image path: $path');
    imageData = ImageData(fileName: path);
  }

  KycUploadRequest? kycUploadRequest;
  Future<void> addDataRequest() async {
    addImageData().then((value) {
      kycUploadRequest =
          KycUploadRequest(imageType: 'Front', imageData: imageData!);
      print(
          'data request ${kycUploadRequest!.imageType} ${kycUploadRequest!.imageData.fileName} ${kycUploadRequest!.imageData.base64} ${kycUploadRequest!.imageData.mimeType}');
    });
  }

  void onSubmit(BuildContext context,
      {required Function onSuccess, required Function onError}) {
    loadCCCDFront(kycUploadRequest!).then((value) {
      if (kycFrontResponse!.ekycResult!.resultCode == 0) {
        isSuccess = true;
        print('ghfffhgfg');
        notifyListeners();
      }
      onSuccess();
      return;
    }).onError((error, stackTrace) {
      //
      MessageManager.onErrorDialog(context, error);
      return;
    });
  }
}
