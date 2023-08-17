import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/themes/colors.dart';
import 'package:skeletons/skeletons.dart';

class ClinicWidget extends StatelessWidget {
  const ClinicWidget({
    Key? key,
    this.clinic,
    this.documentCreator,
    required this.isLoadingData,
    required this.isSignByClinic,
    this.signClinic,
    this.signEmployee,
  }) : super(key: key);

  final DocumentMetaLpuModel? clinic;
  final DocumentMetaDocumentCreatorModel? documentCreator;
  final bool isLoadingData;
  final bool isSignByClinic;
  final DocumentMetaSignClinicModel? signClinic;
  final DocumentMetaSignEmployerModel? signEmployee;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/clinics/ic_map_marker.svg'),
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
                      '"${clinic!.name}", ${clinic!.address}',
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
                            'Создал документ:\n${documentCreator!.lastname} ${documentCreator!.firstname} ${documentCreator!.middlename}, ${documentCreator!.jobTitle}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                ],
              )
            : const SizedBox(),
        !isLoadingData && isSignByClinic && signClinic != null
            ? Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    border: Border.all(
                      color: AppColors.signedBlueColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'ДОКУМЕНТ ПОДПИСАН\nЭЛЕКТРОННОЙ ПОДПИСЬЮ',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.signedBlueColor,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.signedBlueColor,
                        padding: const EdgeInsets.all(2),
                        child: const Center(
                          child: Text(
                            'СВЕДЕНИЯ О СЕРТИФИКАТЕ',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SignClinicDataStr(
                                value: 'С/Н: ${signClinic!.certNumber}',
                              ),
                              SignClinicDataStr(
                                value: 'Владелец: ${signClinic!.owner}',
                              ),
                              SignClinicDataStr(
                                value:
                                    'Срок действия с ${DateFormat('dd.MM.yy').format(signClinic!.validFrom)} по ${DateFormat('dd.MM.yy').format(signClinic!.validTo)}',
                              ),
                              signEmployee != null
                                  ? SignClinicDataStr(
                                      value:
                                          'МО: ${signEmployee?.organization}',
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class SignClinicDataStr extends StatelessWidget {
  const SignClinicDataStr({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: false,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.signedBlueColor,
      ),
    );
  }
}
