import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/modules/about_clinic/price/price_list.dart';
import 'package:medlike/modules/about_clinic/price/price_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/not_found_data/not_found_data.dart';

class PricePage extends StatelessWidget {
  const PricePage({Key? key, required this.clinicId}) : super(key: key);

  final String clinicId;

  @override
  Widget build(BuildContext context) {
    context.read<ClinicsCubit>().getPriceList(clinicId);

    void _onFilterList(String filterStr) {
      context.read<ClinicsCubit>().filterPriceList(filterStr);
    }

    return DefaultScaffold(
      appBarTitle: 'Прейскурант',
      isSearch: true,
      filteringFunction: _onFilterList,
      isChildrenPage: true,
      child: BlocBuilder<ClinicsCubit, ClinicsState>(
        builder: (context, state) {
          if (state.getPriceListStatus == GetPriceListStatuses.failed) {
            return const Text('');
          } else if (state.getPriceListStatus == GetPriceListStatuses.success) {
            return state.priceList!.isNotEmpty && state.filteredPriceList!.isEmpty
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
