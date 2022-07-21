import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class MedcardFileItem extends StatelessWidget {
  const MedcardFileItem(
      {Key? key, required this.medcardFileItem, required this.onTap})
      : super(key: key);

  final MedcardDocsModel medcardFileItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SubscribeRowItem(
      title: medcardFileItem.nameDoc,
      subtitle: DateFormat('dd.MM.yyyy').format(medcardFileItem.dateSign),
      isRightArrow: true,
      onTap: onTap,
    );
  }
}
