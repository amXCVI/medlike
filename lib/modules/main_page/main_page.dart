import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/main_page/appointments/appointments_widget.dart';
import 'package:medlike/modules/main_page/grid/grid_item.dart';
import 'package:medlike/modules/main_page/grid/grid_items_list.dart';
import 'package:medlike/modules/main_page/notifications/appointment_confirm_widget.dart';
import 'package:medlike/modules/main_page/notifications/notifications_widget.dart';
import 'package:medlike/modules/main_page/slider/slider_widget.dart';
import 'package:medlike/modules/settings/exit_app/exit_app_dialog.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/modules/main_page/barcode/barcode_button.dart';
import 'package:medlike/widgets/web_future_image/web_future_image.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getUserProfiles(false);
    context.read<ClinicsCubit>().getAllClinicsList(false);

    return WillPopScope(
      onWillPop: () async {
        showDialog<void>(
            context: context,
            builder: (context) => const ExitAppDialog(
                  goToLoginPage: false,
                ));
        return false;
      },
      child: DefaultScaffold(
          appBarTitle: 'Главная',
          isChildrenPage: false,
          actionButton: FloatingActionButton.extended(
            onPressed: () {
              context.router.navigateNamed(AppRoutes.subscribeProfiles);
            },
            label: Text(
              'Записаться'.toUpperCase(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          rightBottomWidget: const BarcodeButton(),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              const AppointmentsConfirmWidget(),
              const NotificationsWidget(),
              const AppointmentsWidget(),
              const SliderWidget(),
              const SizedBox(height: 8),
              WebFutureImage(
                imageUrl:
                    '${ApiConstants.baseUrl}/api/v1.0/promotions/8ced9223-396d-4665-91f2-76a470f5d565/banner',
                isWithButton: true,
              ),
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.7,
                ),
                padding: const EdgeInsets.only(
                    top: 8.0, right: 8.0, bottom: 24.0, left: 8.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ...gridItemsList
                      .map((item) => GridItem(
                            label: item.label,
                            imgSrc: item.imgSrc,
                            actionLink: item.actionLink,
                          ))
                      .toList(),
                ],
              ),
            ],
          )),
    );
  }
}
