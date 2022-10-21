import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/file_icons_helper.dart';
import 'package:medlike/utils/helpers/file_size_helpers.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class AttachFilesList extends StatelessWidget {
  const AttachFilesList(
      {Key? key, required this.filesList, required this.handleDeleteFile})
      : super(key: key);

  final List<File> filesList;
  final void Function(File file) handleDeleteFile;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        filesList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Прикрепленные файлы',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 12, color: AppColors.lightText),
                  textAlign: TextAlign.start,
                ),
              )
            : const SizedBox(),
        ...filesList.map((e) {
          return Slidable(
            key: UniqueKey(),
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              dismissible: DismissiblePane(
                onDismissed: () {
                  handleDeleteFile(e);
                },
              ),
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      handleDeleteFile(e);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).errorColor,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(width: 20.0),
                            SvgPicture.asset(
                                'assets/icons/settings/ic_delete_support_file.svg'),
                            const SizedBox(width: 20.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              child: Row(
                children: [
                  FileIconsHelper.notImageFileTypesList.contains(
                          MediaType.parse(lookupMimeType(e.path) as String)
                              .toString()
                              .toUpperCase()
                              .split('/')
                              .last
                              .toLowerCase())
                      ? Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.mainBrand[50],
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0))),
                          child: SvgPicture.asset(
                              FileIconsHelper.getCustomFileIcon(MediaType.parse(
                                      lookupMimeType(e.path) as String)
                                  .toString()
                                  .toUpperCase()
                                  .split('/')
                                  .last)),
                        )
                      : CircleAvatar(radius: 20, backgroundImage: FileImage(e)),
                  const SizedBox(width: 24),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.path.split('/').last,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${MediaType.parse(lookupMimeType(e.path) as String).toString().toUpperCase().split('/').last}・${FileSizeHelper.converterBytesToKbOrMb(e.lengthSync())}・${(DateFormat("dd.MM.yyyy").format(DateTime.now()))}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.lightText),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList()
      ],
    );
  }
}
