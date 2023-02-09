import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum DismissibleActionType {
  exit,
  trash
}

class DismissibleAction extends StatelessWidget {
  const DismissibleAction({
    Key? key,
    required this.onDismiss,
    this.verticalPadding = 34,
    this.type = DismissibleActionType.exit,
  }) : super(key: key);

  final VoidCallback onDismiss;
  final double verticalPadding;
  final DismissibleActionType type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onDismiss,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).errorColor,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.end,
              children: [
                const SizedBox(width: 20.0),
                SvgPicture.asset(
                  type == DismissibleActionType.exit
                  ? 'assets/icons/appointments/ic_delete_appointment.svg'
                  : 'assets/icons/settings/ic_delete_support_file.svg'
                ),
                const SizedBox(width: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
