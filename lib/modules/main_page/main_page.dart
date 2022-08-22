import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/main_page/grid_item.dart';
import 'package:medlike/modules/main_page/grid_items_list.dart';
import 'package:medlike/modules/main_page/slider/slider_widget.dart';
import 'package:medlike/modules/settings/exit_app/exit_app_dialog.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/modules/main_page/barcode_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getUserProfiles(false);

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
          child: Column(
            children: [
              const SliderWidget(),
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
                          actionLink: item.actionLink))
                      .toList(),
                ],
              ),
            ],
          )),
    );
  }
}
