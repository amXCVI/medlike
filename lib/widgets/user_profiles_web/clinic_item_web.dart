import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/project_determiner.dart';

class ClinicItemWeb extends StatelessWidget {
  const ClinicItemWeb({
    Key? key,
    required this.clinicData,
    required this.isSelectedItem,
  }) : super(key: key);

  final UserProfileClinic clinicData;
  final bool isSelectedItem;

  @override
  Widget build(BuildContext context) {
    String address = clinicData.clinicName ?? '';

    return SizedBox(
      width: ProjectDeterminer.getProjectType() == Projects.WEB
          ? null
          : MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(2.0),
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelectedItem
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.background,
                    width: 2.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(44.0))),
              child:
                  SvgPicture.asset('assets/icons/app_bar/ic_clinic_place.svg'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isSelectedItem
                            ? Theme.of(context).primaryColor
                            : AppColors.mainText),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
