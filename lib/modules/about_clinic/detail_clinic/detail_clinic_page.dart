import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/about_clinic/detail_clinic/address.dart';
import 'package:medlike/modules/about_clinic/detail_clinic/phones_list.dart';
import 'package:medlike/modules/about_clinic/detail_clinic/work_times_list.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/dividers/default_divider.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class DetailClinicPage extends StatefulWidget {
  const DetailClinicPage({
    Key? key,
    required this.selectedClinic,
  }) : super(key: key);

  final ClinicModel selectedClinic;

  @override
  State<DetailClinicPage> createState() => _DetailClinicPageState();
}

class _DetailClinicPageState extends State<DetailClinicPage> {
  late BuildingModel selectedBuilding;

  @override
  void initState() {
    super.initState();
    selectedBuilding = widget.selectedClinic.buildings[0];
  }

  @override
  Widget build(BuildContext context) {
    void _handleTapPrice() {
      context.router.push(PriceRoute(clinicId: widget.selectedClinic.id));
    }

    void _handleTapSales() {
      context.router.push(SalesRoute(clinicId: widget.selectedClinic.id));
    }

    void _handleTapSubscribe(int profilesCount, String userId) {
      if (profilesCount == 1) {
        context.router.push(ServicesListRoute(
            userId: userId,
            buildingId: selectedBuilding.id,
            clinicId: widget.selectedClinic.id));
      } else {
        context.router.push(const ProfilesListRoute());
      }
    }

    return DefaultScaffold(
      appBarTitle: widget.selectedClinic.name,
      isChildrenPage: true,
      actionButton: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return FloatingActionButton.extended(
            onPressed: () {
              _handleTapSubscribe(
                  state.userProfiles!.length, state.selectedUserId as String);
            },
            label: Text(
              'Записаться'.toUpperCase(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          );
        },
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          WorkTimesList(workTimes: selectedBuilding.workTime),
          PhonesList(phonesList: selectedBuilding.phone),
          ClinicAddress(address: selectedBuilding.address),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DefaultDivider(
              color: Theme.of(context).dividerColor,
            ),
          ),
          SubscribeRowItem(
            title: 'Прейскурант',
            customIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                  'assets/icons/clinics/ic_attention_circle.svg'),
            ),
            isFirstSymbolForIcon: false,
            onTap: _handleTapPrice,
          ),
          SubscribeRowItem(
            title: 'Акции и скидки',
            customIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset('assets/icons/clinics/ic_stok_star.svg'),
            ),
            isFirstSymbolForIcon: false,
            onTap: _handleTapSales,
          )
        ],
      ),
    );
  }
}
