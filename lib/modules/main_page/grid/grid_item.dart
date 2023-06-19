import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/themes/colors.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    Key? key,
    required this.label,
    required this.imgSrc,
    required this.actionLink,
    this.actionRoute,
  }) : super(key: key);

  final String label;
  final String imgSrc;
  final String actionLink;
  final dynamic actionRoute;

  @override
  Widget build(BuildContext context) {
    void handleTapOnItem() {
      switch (actionLink) {
        case AppRoutes.clinicInfo:
          context.router.pushAll([AllClinicsListRoute(
            isFromMainPage: true,
          )]);
          break;
        default:
          context.router.pushNamed(actionLink);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.homeCategoriesGradientColor1,
                // AppColors.homeCategoriesGradientColor2,
                AppColors.homeCategoriesGradientColor3,
              ],
              stops: [
                0,
                // 0.5,
                1,
              ]),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: Material(
            child: InkWell(
              highlightColor: Theme.of(context).highlightColor,
              onTap: handleTapOnItem,
              child: Stack(
                children: [
                  Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Image.asset(imgSrc,
                          width: MediaQuery.of(context).size.width <
                                  AppConstants.smScreenWidth
                              ? 70
                              : 100)),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width <
                            AppConstants.smScreenWidth
                        ? MediaQuery.of(context).size.width * 0.40
                        : MediaQuery.of(context).size.width * 0.32,
                    child: Text(
                      label,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
