import 'package:app/components/fss_text_button/loading_text_button.dart';
import 'package:app/globals.dart';
import 'package:app/modules/xac_thuc_giay_to/notifier/chup_cccd_mat_truoc_change_notifier.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class ChupCCCDMatTruoc extends StatefulWidget {
  const ChupCCCDMatTruoc({super.key});

  @override
  State<ChupCCCDMatTruoc> createState() => _ChupCCCDMatTruocState();
}

class _ChupCCCDMatTruocState extends State<ChupCCCDMatTruoc> {
  final LoadingTextButtonController btnController =
      LoadingTextButtonController();

  late CameraController camController;
  late ChupCCCDMatTruocChangeNotifier _notifier;

  @override
  void initState() {
    initCamera();
    _notifier = context.read<ChupCCCDMatTruocChangeNotifier>();

    super.initState();
  }

  Future<void> initCamera() async {
    camController = CameraController(cameras[0], ResolutionPreset.max);
    camController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('access was denied');
            break;
          default:
            print(e.description);
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    camController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: Text(
            'Chọn loại giấy tờ',
            style: ThemeProvider.themeOf(context)
                .data
                .textTheme
                .titleMedium!
                .copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(34, 14, 38, 1)),
          ),
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CameraPreview(camController),
            ),
            ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcOut),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        backgroundBlendMode: BlendMode.dstOut),
                  ),
                  Positioned(
                    top: 78,
                    child: Container(
                      height: 210,
                      width: MediaQuery.of(context).size.width - 48,
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                'Vui Long dat anh vao mat truoc CCCD vao khung hinh va bam nut chup',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Positioned(
              top: 300,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildCCCDItem(
                        context: context,
                        tile: 'Mặt trước',
                        borderColor: const Color.fromRGBO(22, 88, 228, 1),
                        imgPath: 'assets/images/cccd_truoc.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    buildCCCDItem(
                        context: context,
                        tile: 'Mặt sau',
                        isFront: _notifier.isFont,
                        //isAuthentication: 'assets/images/svg/icon_warning.svg',
                        imgPath: 'assets/images/cccd_sau.png'),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

Widget buildCCCDItem(
    {required BuildContext context,
    required String imgPath,
    bool? isAuthentication,
    Color? borderColor,
    bool? isFront,
    required String tile}) {
  return Expanded(
    child: Column(children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.fromBorderSide(BorderSide(
                color: borderColor ?? const Color.fromRGBO(230, 230, 230, 1)))),
        child: Column(
          children: [
            Image.asset(
              imgPath,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(tile),
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      if (isFront ?? true)
        Consumer<ChupCCCDMatTruocChangeNotifier>(
          builder: (context, provider, child) {
            return provider.isAuthentication
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      provider.isSuccess
                          ? 'assets/images/svg/icon_success.svg'
                          : 'assets/images/svg/icon_warning.svg',
                      height: 40,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : Container();
          },
        )
    ]),
  );
}



// Padding(
//               padding:
//                   const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 30),
//               child: Column(
//                 children: [
//                   const Text(
//                       'Vui Long dat anh vao mat truoc CCCD vao khung hinh va bam nut chup'),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   SizedBox(
//                     width: double.maxFinite,
//                     height: 210,
//                     child: AspectRatio(
//                         aspectRatio: 3.0 / 4.0,
//                         child: OverflowBox(
//                           alignment: Alignment.center,
//                           child: FittedBox(
//                             fit: BoxFit.fitWidth,
//                             child: SizedBox(
//                                 height: 210,
//                                 width: 300,
//                                 child: CameraPreview(camController)),
//                           ),
//                         )),
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       buildCCCDItem(
//                           context: context,
//                           tile: 'Mặt trước',
//                           borderColor: const Color.fromRGBO(22, 88, 228, 1),
//                           imgPath: 'assets/images/cccd_truoc.png'),
//                       const SizedBox(
//                         width: 12,
//                       ),
//                       buildCCCDItem(
//                           context: context,
//                           tile: 'Mặt sau',
//                           isFront: _notifier.isFont,
//                           //isAuthentication: 'assets/images/svg/icon_warning.svg',
//                           imgPath: 'assets/images/cccd_sau.png'),
//                     ],
//                   ),
//                   const Spacer(),
//                   Consumer<ChupCCCDMatTruocChangeNotifier>(
//                       builder: (context, provider, child) {
//                     return provider.isAuthentication
//                         ? provider.isSuccess
//                             ? LoadingTextButton(
//                                 controller: btnController,
//                                 onPressed: () {
//                                   // _notifier.addImageData();
//                                   // print('data request ');
//                                   // _notifier.addDataRequest();
//                                   // _notifier.successAuthented();

//                                   // Navigator.pushNamed(
//                                   //     context, AppRoutesConst.chupAnhKhuonMat);
//                                   //value.check();
//                                 },
//                                 title: 'Chup Mat sau')
//                             : LoadingTextButton(
//                                 controller: btnController,
//                                 onPressed: () {
//                                   _notifier.addDataRequest();
//                                   _notifier.onSubmit(context, onSuccess: () {
//                                     print(_notifier.isSuccess);
//                                   }, onError: () {});
//                                   // _notifier.addImageData();

//                                   // _notifier.addDataRequest();
//                                   // _notifier.successAuthented();

//                                   // Navigator.pushNamed(
//                                   //     context, AppRoutesConst.chupAnhKhuonMat);
//                                   //value.check();
//                                 },
//                                 title: 'Chup Măt trước')
//                         : InkWell(
//                             onTap: () {
//                               print('chup anh');
//                               _notifier.addDataRequest().then((value) {
//                                 _notifier.isAuthentication = true;

//                                 _notifier.onSubmit(context, onSuccess: () {
//                                   print(_notifier.isSuccess);
//                                 }, onError: () {
//                                   print('error');
//                                   _notifier.isSuccess = false;
//                                 });
//                               });
//                             },
//                             child: SizedBox(
//                               width: 84,
//                               height: 84,
//                               child: SvgPicture.asset(
//                                   'assets/images/svg/icon_chup_anh.svg'),
//                             ),
//                           );
//                   })
//                 ],
//               ),
//             ),
