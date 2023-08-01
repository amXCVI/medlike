import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:skeletons/skeletons.dart';

class PatientWidget extends StatelessWidget {
  const PatientWidget(
      {Key? key,
      this.patient,
      required this.patientSignUrl,
      required this.isLoadingData})
      : super(key: key);

  final DocumentMetaPatientModel? patient;
  final String patientSignUrl;
  final bool isLoadingData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Пациент',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/appointments/profile.svg'),
            const SizedBox(width: 8),
            isLoadingData
                ? Expanded(
                    child: SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          padding: const EdgeInsets.all(0),
                          lines: 2,
                          spacing: 4,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 10,
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  )
                : Flexible(
                    child: Text(
                      '${patient!.lastname} ${patient!.firstname} ${patient!.middlename}, ${patient!.sex}, ${/*DateFormat('DD.MM.yy').format*/ (patient!.birthday)} г., ${patient!.adresses ?? ''}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
          ],
        )
      ],
    );
  }
}
