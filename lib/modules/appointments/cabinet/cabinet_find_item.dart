import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/data/models/models.dart';
import 'package:medlike/modules/appointments/cabinet/cabinet_find_image.dart';

class CabinetFindItem extends StatelessWidget {
  const CabinetFindItem({super.key, required this.appointment});

  final AppointmentModelWithTimeZoneOffset appointment;

  @override
  Widget build(BuildContext context) {
    if (appointment.cabinetInfo == null || appointment.status == 1) {
      return const SizedBox();
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Как найти кабинет',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: appointment.cabinetInfo?.description == null
                    ? <Widget>[const SizedBox()]
                    : [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: SvgPicture.asset(
                              'assets/icons/appointments/solid.svg'),
                        ),
                        Flexible(
                          child: Text(
                            appointment.cabinetInfo?.description ?? "",
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
              ),
              const SizedBox(
                height: 15,
              ),
              CabinetFindImage(cabinetId: appointment.cabinetInfo!.id)
            ],
          ),
        ),
      ],
    );
  }
}
