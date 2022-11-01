import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DismissibleAction extends StatelessWidget {
  const DismissibleAction({
    Key? key,
    required this.onDismiss,
    this.verticalPadding = 34
  }) : super(key: key);

  final VoidCallback onDismiss;
  final double verticalPadding;

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
                    'assets/icons/appointments/ic_delete_appointment.svg'),
                const SizedBox(width: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
