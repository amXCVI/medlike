import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';

class ClinicInfo extends StatelessWidget {
  const ClinicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {
        String clinicInfoStr =
            '"${state.selectedBuilding!.name}"\n${state.selectedTimetableCell!.cabinetName}, ${state.selectedBuilding!.address}';

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/appointments/solid.svg'),
            const SizedBox(width: 8.0),
            Flexible(
              child: Text(
                clinicInfoStr,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                softWrap: true,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        );
      },
    );
  }
}
