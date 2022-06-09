import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/modules/main_page/grid_item.dart';
import 'package:medlike/modules/main_page/grid_items_list.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        appBarTitle: 'Главная',
        actionButton: FloatingActionButton.extended(
          onPressed: () {
            context.router.navigateNamed(AppRoutes.subscribeProfiles);
          },
          label: Text(
            'Записаться'.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: () => context.router.pushNamed(AppRoutes.login),
                child: const Text('push to login'),
              ),
              ElevatedButton(
                  onPressed: () {
                    AppToast.showAppToast(msg: 'msg');
                  },
                  child: Text('show toast')),
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
        ));
  }
}
