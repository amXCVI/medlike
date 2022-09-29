import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/modules/about_clinic/sales/promotions_list.dart';
import 'package:medlike/modules/about_clinic/sales/promotions_list_skeleton.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/not_found_data/empty_list_widget.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({Key? key, required this.clinicId}) : super(key: key);

  final String clinicId;

  @override
  Widget build(BuildContext context) {
    void _onLoadDada({bool isRefresh = false}) {
      context.read<ClinicsCubit>().getPromotionsList(clinicId: clinicId);
    }

    _onLoadDada();

    return DefaultScaffold(
      appBarTitle: 'Акции и скидки',
      isChildrenPage: true,
      child: BlocBuilder<ClinicsCubit, ClinicsState>(
        builder: (context, state) {
          if (state.getPromotionsListStatus ==
              GetPromotionsListStatuses.failed) {
            return const Text('');
          } else if (state.getPromotionsListStatus ==
              GetPromotionsListStatuses.success) {
            return state.promotionsList!.isNotEmpty
                ? PromotionsList(
                    promotionsList:
                        state.promotionsList as List<ClinicPromotionModel>,
                    onRefreshData: _onLoadDada,
                  )
                : const EmptyListWidget(
                    imgPath: 'assets/images/empty_sales.png',
                    label: 'Здесь будет список акций клиники');
          } else {
            return const PromotionsListSkeleton();
          }
        },
      ),
    );
  }
}
