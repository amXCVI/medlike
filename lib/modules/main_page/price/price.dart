import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/about_clinic/price/price_list.dart';
import 'package:medlike/modules/about_clinic/price/price_list_skeleton.dart';
import 'package:medlike/widgets/not_found_data/not_found_data.dart';

class Price extends StatelessWidget {
  const Price({Key? key}) : super(key: key);

  void onLoadDada(BuildContext context,
      {bool isRefresh = false,
      required String clinicId,
      List<String>? categories}) {
    context.read<ClinicsCubit>().getPriceList(clinicId, []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: BlocBuilder<ClinicsCubit, ClinicsState>(
        builder: (context, clinicState) {
          return BlocBuilder<UserCubit, UserState>(
              builder: (context, userState) {
            if (userState.getUserProfileStatus ==
                    GetUserProfilesStatusesList.success &&
                clinicState.priceList == null &&
                clinicState.getPriceListStatus ==
                    GetPriceListStatuses.initial) {
              onLoadDada(context,
                  clinicId: userState.userProfiles!.first.clinics.first.id);
            }
            if (clinicState.getPriceListStatus == GetPriceListStatuses.failed) {
              return const SizedBox();
            } else if (clinicState.getPriceListStatus ==
                GetPriceListStatuses.success) {
              return clinicState.priceList!.isNotEmpty &&
                      clinicState.filteredPriceList!.isEmpty
                  ? const NotFoundData()
                  : PriceList(
                      priceList:
                          clinicState.filteredPriceList as List<PriceItemModel>,
                    );
            } else {
              return const PriceListSkeleton();
            }
          });
        },
      ),
    );
  }
}
