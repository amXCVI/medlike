import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/dom_parsing.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/animation/animate_slidable.dart';

/// Slidable  widget that slides to the right on drag
class SlidableWidget extends StatelessWidget {
  /// [onDissmis] action called on slidable dismiss
  ///
  /// [dissmisText] text that displayed under front panel
  ///
  /// [childWidget] widget displayed on top of the panel
  ///
  /// [previewOnSutisfy] animate slider opening on action returned `true`
  ///
  /// [afterPreviewAction] action that'll be `invoke`d after end of slide animation
  const SlidableWidget({
    super.key,
    required this.onDissmis,
    required this.dissmisText,
    required this.childWidget,
    required this.previewOnSutisfy,
    required this.afterPreviewAction,
    this.slidable = true,
  });

  final void Function() onDissmis;

  final bool slidable;
  final Widget childWidget;
  final Future<bool> previewOnSutisfy;
  final void Function() afterPreviewAction;
  final String dissmisText;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          onDissmis();
        }),
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                color: Theme.of(context).colorScheme.error,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20.0),
                    SvgPicture.asset(
                        'assets/icons/appointments/ic_delete_appointment.svg'),
                    const SizedBox(width: 20.0),
                    Expanded(
                      //flex: 1,
                      child: Text(
                        dissmisText,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white, fontSize: 12),
                        //overflow: TextOverflow.fade,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      child: _SlidableChildWidget(
        childWidget: childWidget,
        previewOnSutisfy: previewOnSutisfy,
        afterPreviewAction: afterPreviewAction,
      ),
    );
  }
}

class _SlidableChildWidget extends StatefulWidget {
  const _SlidableChildWidget(
      {required this.childWidget,
      required this.previewOnSutisfy,
      required this.afterPreviewAction});

  final Widget childWidget;
  final Future<bool> previewOnSutisfy;
  final void Function() afterPreviewAction;

  @override
  _SlidableChildWidgetState createState() => _SlidableChildWidgetState();
}

class _SlidableChildWidgetState extends State<_SlidableChildWidget> {
  @override
  void initState() {
    super.initState();

    widget.previewOnSutisfy.then((value) {
      if (!value) {
        return;
      }
      animateDeleting(context, widget.afterPreviewAction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.childWidget;
  }
}
