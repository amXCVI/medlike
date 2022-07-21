import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/modules/medcard/files/attach_files_functions_list.dart';
import 'package:medlike/widgets/icon_with_bottom_label/icon_with_bottom_label.dart';

class AttachFileButton extends StatelessWidget {
  const AttachFileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            context: context,
            builder: (context) => Container(
                  height: 48 * 3 + 16 + 24,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: const AttachFilesFunctionsList(),
                ));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: IconWithBottomLabel(
        icon: SvgPicture.asset(
            'assets/icons/bottom_nav_bar/ic_attach_outline.svg'),
        label: 'Добавить',
      ),
    );
  }
}
