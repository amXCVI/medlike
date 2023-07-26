import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/constants/document_statuses.dart';
import 'package:medlike/data/models/document_models/document_models.dart';
import 'package:medlike/themes/colors.dart';

class DocumentItem extends StatelessWidget {
  const DocumentItem(
      {Key? key, required this.documentItem, required this.onTap})
      : super(key: key);

  final DocumentModel documentItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: Material(
          color: Theme.of(context).colorScheme.background,
          child: InkWell(
            highlightColor: Theme.of(context).highlightColor,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 72,
                        child: Text(
                          documentItem.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: AppColors.mainText),
                        ),
                      ),
                      SvgPicture.asset(
                          'assets/icons/subscribe/right_arrow_icon.svg')
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    DocumentStatuses.getStatus(
                      isSignByPatient: documentItem.isSignByPatient,
                      isSignByEmployee: documentItem.isSignByEmployee,
                    ).statusName,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.lightText),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/appointments/solid.svg'),
                      const SizedBox(width: 8.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Text(documentItem.lpu.address,
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      documentItem.signedByEmployeeAt != null
                          ? RichText(
                              text: WidgetSpan(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.circleBgFirst,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/appointments/clock.svg'),
                                      const SizedBox(width: 8.0),
                                      Text(DateFormat('HH:mm DD.MM.yy').format(
                                          documentItem.signedByEmployeeAt!)),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(width: 8.0),
                      documentItem.signEmployer != null
                          ? RichText(
                              text: WidgetSpan(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.circleBgFirst,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/appointments/profile.svg'),
                                      const SizedBox(width: 8.0),
                                      Text(
                                          documentItem.signEmployer!.firstname),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
