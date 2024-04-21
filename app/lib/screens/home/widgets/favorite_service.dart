import 'package:app/enums/loading_state_enum.dart';
import 'package:app/screens/home/notifiers/favorite_service_change_notifier.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data/data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:app/globals.dart' as globals;
import '../../../configs/routes/app_routes_const.dart';
import 'shimmers/service_shimmer.dart';

class FavoriteService extends StatefulWidget {
  const FavoriteService({super.key});

  @override
  State<FavoriteService> createState() => _FavoriteServiceState();
}

class _FavoriteServiceState extends State<FavoriteService> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildFavoriteServiceHeader(context),
        Consumer<FavoriteServiceChangeNotifier>(
          builder: (context, favoriteServiceChangeNotifier, child) {
            if (favoriteServiceChangeNotifier.loadingState ==
                LoadingStateEnum.loading) {
              return const ServiceShimmer();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 20),
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    favoriteServiceChangeNotifier.favouriteServices.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (_, index) {
                  Service item =
                      favoriteServiceChangeNotifier.favouriteServices[index];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (item.icon?.defaulturl != null)
                          ? Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  child: CachedNetworkImage(
                                    imageUrl: item.icon!.defaulturl!,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffEC3A39),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 0.5,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 1,
                                    ),
                                    child: Text(
                                      item.overlayText ?? '',
                                      style: const TextStyle(
                                        fontSize: 9,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(height: 4),
                      Text(
                        item.description ?? '-',
                        textAlign: TextAlign.center,
                        style: ThemeProvider.themeOf(context)
                            .data
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 12),
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                      ),
                    ],
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }

  Widget _buildFavoriteServiceHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('home-screen.titles.services'.tr(),
              style: ThemeProvider.themeOf(context).data.textTheme.titleMedium),
          InkWell(
            onTap: () {
              if (globals.navigatorContext != null) {
                Navigator.of(globals.navigatorContext!)
                    .pushNamed(AppRoutesConst.dichVu);
              }
            },
            child: Text(
              "base.all".tr(),
              style: ThemeProvider.themeOf(context)
                  .data
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                      color: ThemeProvider.themeOf(context).data.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
