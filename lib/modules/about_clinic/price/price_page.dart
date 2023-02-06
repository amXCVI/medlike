import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/modules/about_clinic/price/price_filters_widget.dart';
import 'package:medlike/modules/about_clinic/price/price_list.dart';
import 'package:medlike/modules/about_clinic/price/price_list_skeleton.dart';
import 'package:medlike/widgets/app_bar/medcard_app_bar/medcard_app_bar.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/not_found_data/not_found_data.dart';

class PricePage extends StatefulWidget {
  const PricePage({Key? key, required this.clinicId}) : super(key: key);

  final String clinicId;

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  late bool isFilteringMode = false;
  late bool isShowingFilters = false;
  List<String> selectedFilters = [''];
  GlobalKey widgetOverBodyGlobalKey = GlobalKey();

  @override
  void initState() {
    handleResetFilters();
    _onLoadDada(
      isRefresh: true,
      categories: selectedFilters,
    );
    super.initState();
  }

  void _onLoadDada({bool isRefresh = false, List<String>? categories}) {
    context
        .read<ClinicsCubit>()
        .getPriceList(widget.clinicId, categories, isRefresh);
  }

  void handleTapOnFiltersButton() {
    if (isFilteringMode) {
      _onLoadDada(
        isRefresh: true,
        categories: selectedFilters,
      );
      setState(() {
        isShowingFilters = false;
        isFilteringMode = false;
      });
    } else {
      setState(() {
        isFilteringMode = true;
      });
    }
  }

  void handleResetFilters() {
    if (selectedFilters.isNotEmpty) {
      context.read<ClinicsCubit>().getPriceList(widget.clinicId, [], true);
    }
    setState(() {
      isShowingFilters = false;
      isFilteringMode = false;
      selectedFilters = [];
    });
  }

  // void handleTapOnFilterItem(String filterValue) {
  //   if (selectedFilters.isEmpty) {
  //     setState(() {
  //       selectedFilters.add(filterValue);
  //     });
  //     return;
  //   }
  //   if (filterValue.isEmpty) {
  //     if (selectedFilters.contains(filterValue)) {
  //       setState(() {
  //         selectedFilters.remove(filterValue);
  //       });
  //     } else {
  //       setState(() {
  //         selectedFilters.clear();
  //         selectedFilters.add(filterValue);
  //       });
  //     }
  //     return;
  //   }
  //   if (selectedFilters.contains(filterValue)) {
  //     if (selectedFilters.first.isEmpty) {
  //       setState(() {
  //         selectedFilters.remove(filterValue);
  //       });
  //     } else {
  //       setState(() {
  //         selectedFilters.remove(filterValue);
  //       });
  //     }
  //   } else {
  //     if (selectedFilters.first.isNotEmpty) {
  //       setState(() {
  //         selectedFilters.add(filterValue);
  //       });
  //     } else {
  //       setState(() {
  //         selectedFilters.remove(selectedFilters.first);
  //         selectedFilters.add(filterValue);
  //       });
  //     }
  //   }
  // }

  void handleTapOnFilterItem(String filterValue) {
    if (selectedFilters.contains(filterValue)) {
      setState(() {
        selectedFilters = [''];
      });
      return;
    }
    setState(() {
      selectedFilters = [filterValue];
    });
  }

  void _onFilterList(String filterStr, BuildContext context) {
    context.read<ClinicsCubit>().filterPriceList(filterStr);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Прейскурант',
      isSearch: true,
      filteringFunction: (e) {
        _onFilterList(e, context);
      },
      isChildrenPage: true,
      appBar: MedcardAppBar(
        title: 'Прейскурант',
        filteringFunction: (e) {
          _onFilterList(e, context);
        },
        isChildrenPage: true,
        handleTapOnFiltersButton: handleTapOnFiltersButton,
        handleResetFilters: handleResetFilters,
        isFilteringMode: isFilteringMode,
      ),
      widgetOverBody: PriceFiltersWidget(
        key: widgetOverBodyGlobalKey,
        selectedFilters: selectedFilters,
        handleTapOnFilterItem: handleTapOnFilterItem,
      ),
      widgetOverBodyGlobalKey:
          isShowingFilters || isFilteringMode ? widgetOverBodyGlobalKey : null,
      child: BlocBuilder<ClinicsCubit, ClinicsState>(
        builder: (context, state) {
          if (state.getPriceListStatus == GetPriceListStatuses.failed) {
            return const Text('');
          } else if (state.getPriceListStatus == GetPriceListStatuses.success) {
            return state.priceList!.isNotEmpty &&
                    state.filteredPriceList!.isEmpty
                ? const NotFoundData()
                : PriceList(
                    priceList: state.filteredPriceList as List<PriceItemModel>,
                  );
          } else {
            return const PriceListSkeleton();
          }
        },
      ),
    );
  }
}
