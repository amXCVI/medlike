import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/utils/helpers/file_size_helpers.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class FileItem extends StatelessWidget {
  const FileItem({
    Key? key,
    required this.fileItem,
    required this.onTap,
    required this.isDownloading,
  }) : super(key: key);

  final MedcardUserFileModel fileItem;
  final void Function() onTap;
  final bool isDownloading;

  @override
  Widget build(BuildContext context) {
    return SubscribeRowItem(
      title: fileItem.filename,
      subtitle:
          '${fileItem.type.split('/').last.toUpperCase()}・${FileSizeHelper.converterBytesToKbOrMb(fileItem.length)}・${DateFormat('dd.MM.yyyy').format(fileItem.uploadDate)}',
      onTap: onTap,
      isRightArrow: false,
      customRightAction: isDownloading
          ? const SizedBox(
              child: CircularProgressIndicator.adaptive(),
              width: 20,
              height: 20,
            )
          : const SizedBox(),
    );
  }
}
