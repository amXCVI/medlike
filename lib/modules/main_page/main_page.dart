import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/main_page/grid_item.dart';
import 'package:medlike/modules/main_page/grid_items_list.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getUserProfiles(false);

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
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
          child: Center(
            child: ListView(
              children: [
                CustomScrollView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        crossAxisCount: 2,
                        childAspectRatio: 164 / 101,
                        children: [
                          ...gridItemsList
                              .map((item) => GridItem(
                                  label: item.label,
                                  imgSrc: item.imgSrc,
                                  actionLink: item.actionLink))
                              .toList(),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
