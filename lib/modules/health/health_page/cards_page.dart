import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:flutter_svg/svg.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/modules/health/filters_page/diary_filters_widget.dart';
import 'package:medlike/modules/health/health_page/health_list.dart';
import 'package:medlike/modules/health/health_page/health_list_skeleton.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/diary/diary_cubit.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  late bool isFilteringMode = false;
  GlobalKey widgetOverBodyGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _onLoadDada(String grouping, {String? syn}) {
      context.read<DiaryCubit>().getDiaryCategoriesList(
          project: 'Zapolyarye',
          platform: Platform.isAndroid ? 'Android' : 'IOS');

      context.read<DiaryCubit>().getDiariesList(
          project: 'Zapolyarye',
          platform: Platform.isAndroid ? 'Android' : 'IOS',
          grouping: grouping,
          syn: syn);
    }

    void handleTapOnFiltersButton() {
      if (isFilteringMode) {
        _onLoadDada('None');
        setState(() {
          isFilteringMode = false;
        });
      } else {
        setState(() {
          isFilteringMode = true;
        });
      }
    }

    void handleResetFilters() {
      setState(() {
        isFilteringMode = false;
      });
      _onLoadDada('None');
    }

    _onLoadDada('None');

    return WillPopScope(
      onWillPop: () async {
        if (isFilteringMode) {
          handleResetFilters();
        } else {
          context.router.navigateNamed(AppRoutes.main);
        }
        return false;
      },
      child: DefaultScaffold(
        actions: [
          isFilteringMode
              ? IconButton(
                  onPressed: handleTapOnFiltersButton,
                  icon: SvgPicture.asset(
                      'assets/icons/app_bar/ic_check_filters.svg'))
              : IconButton(
                  onPressed: handleTapOnFiltersButton,
                  icon:
                      SvgPicture.asset('assets/icons/app_bar/filters_icon.svg'))
        ],
        appBarTitle: AppConstants.appName,
        isChildrenPage: true,
        widgetOverBody: isFilteringMode
            ? DiaryFiltersWidget(key: widgetOverBodyGlobalKey)
            : const SizedBox(),
        widgetOverBodyGlobalKey:
            isFilteringMode ? widgetOverBodyGlobalKey : null,
        child: BlocBuilder<DiaryCubit, DiaryState>(
          builder: (context, state) {
            if (state.getDiaryCategoriesStatuses ==
                    GetDiaryCategoriesStatuses.failed ||
                state.getDiaryStatuses == GetDiaryStatuses.failed) {
              return const Text('');
            } else if (state.getDiaryCategoriesStatuses ==
                    GetDiaryCategoriesStatuses.success &&
                state.getDiaryStatuses == GetDiaryStatuses.success) {
              return HealthList(
                  diariesCategoriesList: state.filteredDiariesCategoriesList!,
                  diariesItems: state.weekDiariesList ?? [],
                  firstDate: state.dateFrom,
                  lastDate: state.dateTo,
                  onLoadDada: _onLoadDada);
            } else {
              return const HealthListSkeleton();
            }
          },
        ),
      ),
    );
  }
}
