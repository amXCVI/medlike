import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/data/models/document_models/document_models.dart';

class ClinicWidget extends StatelessWidget {
  const ClinicWidget({Key? key, required this.clinic, this.documentCreator})
      : super(key: key);

  final DocumentMetaLpuModel clinic;
  final DocumentMetaDocumentCreatorModel? documentCreator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Клиника',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            SvgPicture.asset('assets/icons/clinics/ic_map_marker.svg'),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                '"${clinic.name}", ${clinic.address}',
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                softWrap: true,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        documentCreator != null
            ? Row(
                children: [
                  SvgPicture.asset('assets/icons/appointments/profile.svg'),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Создал документ:\n${documentCreator!.lastname} ${documentCreator!.firstname} ${documentCreator!.middlename}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
