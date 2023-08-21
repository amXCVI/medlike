

import 'package:flutter/material.dart';
import './popup.dart';

class TourTooltip {

  /// Just a flag so we won't display more then 1 popup at the time
  static bool _isOnScreen = false;

  BuildContext context;

  TourTooltip(this.context);

  factory TourTooltip.of(BuildContext context) {
    return TourTooltip(context);
  }

  /// Show popup on provided [widgetKey] Widget. Popup'll block
  /// any interaction with ui till dismissed
  ///
  /// [height] - height of the popup
  ///
  /// [width] - width of the popup
  ///
  /// [onDismiss] - callback that'll be fired up after popup'll be closed
  void create(String text, GlobalKey widgetKey,
      {double? height,
      double? width,
      Function? onDismiss,
      Offset? offset}) async {
    // Не рисуем, если какой-то popup уже отрисован и если наш виджет всё ещё отрисован
    if(_isOnScreen || widgetKey.currentContext == null) return;
    // Проверяем - находится ли цель нашего popup'a наверху отрисовки(Стэка)
    if(!ModalRoute.of(context)!.isCurrent) return;
    _isOnScreen = true;
    await showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) => Popup(context,
                offset: offset,
                text: text,
                widgetKey: widgetKey,
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    height: 1.42,
                    color: Colors.white),
                height: height ?? 64,
                width: width ?? 272,
                padding: const EdgeInsets.all(12.0),
                borderRadius: BorderRadius.circular(8.0), onDismiss: () {
              _isOnScreen = false;
              onDismiss?.call();
            }));
  }
}
