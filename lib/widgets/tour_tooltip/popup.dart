import 'package:flutter/material.dart';
import './animated_triangle.dart';

class Popup extends StatefulWidget {
  late double _popupWidth;
  late double _popupHeight;
  double arrowHeight = 10.0;
  late String _text;
  late Offset _offset;
  late Rect _showRect;
  late TextStyle _textStyle;
  late Size _screenSize;
  BuildContext context;
  late BorderRadius _borderRadius;
  late EdgeInsetsGeometry _padding;
  final Color targetColor = Colors.black;
  final GlobalKey widgetKey;
  final Offset? offset;
  final VoidCallback? onDismiss;

  Popup(this.context,
      {super.key,
      double? height,
      double? width,
      this.onDismiss,
      Color? backgroundColor,
      String? text,
      TextStyle? textStyle,
      BorderRadius? borderRadius,
      EdgeInsetsGeometry? padding,
      required this.widgetKey,
      this.offset}) {
    _popupHeight = height ?? 200;
    _popupWidth = width ?? 200;
    _text = text ?? '';
    _textStyle = textStyle ??
        const TextStyle(
            fontWeight: FontWeight.normal, color: Color(0xFF000000));
    _borderRadius = borderRadius ?? BorderRadius.circular(10.0);
    _padding = padding ?? const EdgeInsets.all(4.0);
    _showRect = _getWidgetGlobalRect(widgetKey);
    _screenSize = MediaQuery.of(context).size;
    // View.of(context).physicalSize / View.of(context).devicePixelRatio;
    _calculatePosition(context, offset);
  }

  void _calculatePosition(BuildContext context, Offset? offset) {
    _offset = _calculateOffset(context, offset ?? Offset.zero);
  }

  /// Returns globalRect of widget with key [key]
  Rect _getWidgetGlobalRect(GlobalKey key) {
    RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    return Rect.fromLTWH(
        offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
  }

  /// Returns calculated widget offset using [context]
  Offset _calculateOffset(BuildContext context, Offset offset) {
    double dx = _showRect.left + _showRect.width / 2.0 - _popupWidth / 2.0;
    if (dx < 10.0) {
      dx = 10.0;
    }

    if (dx + _popupWidth > _screenSize.width && dx > 10.0) {
      double tempDx = _screenSize.width - _popupWidth - 10;
      if (tempDx > 10) dx = tempDx;
    }

    dx -= offset.dx;

    double dy = _showRect.top - _popupHeight;

    dy = arrowHeight +
        _showRect.height +
        _showRect.top -
        View.of(context).padding.top / 3; // This on is required - no idea why

    dy -= offset.dy;
    return Offset(dx, dy);
  }

  /// Dismisses the popup
  void dismiss() {
    onDismiss?.call();
  }

  @override
  _PopupState createState() => _PopupState();
}

class _PopupState extends State<Popup> with SingleTickerProviderStateMixin {
  final Duration _animationDuration = const Duration(milliseconds: 200);

  // This on will be controll animation of the main part of popup
  bool _loaded = false;

  // Animation will be provided to the triangle drawer
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);

    // Delaying widget so we could appear popup body with animation
    Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        _loaded = true;
      });
    }).then((value) => _animationController.forward());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: GestureDetector(
          onTap: () {
            widget.dismiss();
            Navigator.of(context).pop();
          },
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                // Triangle arrow
                Positioned(
                  left: widget._showRect.left +
                      widget._showRect.width / 2.0 -
                      7.5,
                  top: widget._offset.dy - widget.arrowHeight,
                  child: CustomPaint(
                    size: Size(15.0, widget.arrowHeight),
                    painter: AnimatedTrianglePainter(
                        targetColor: widget.targetColor,
                        animation: _animationController),
                  ),
                ),

                // Main popup
                Positioned(
                  left: widget._offset.dx,
                  top: widget._offset.dy,
                  child: AnimatedContainer(
                      duration: _animationDuration,
                      padding: widget._padding,
                      width: widget._popupWidth,
                      height: widget._popupHeight,
                      decoration: BoxDecoration(
                        color:
                            !_loaded ? Colors.transparent : widget.targetColor,
                        borderRadius: widget._borderRadius,
                      ),
                      child: SingleChildScrollView(
                          child: RichText(
                        maxLines: 2,
                        text: TextSpan(
                            text: widget._text, style: widget._textStyle),
                      ))),
                )
              ],
            ),
          )),
    );
  }
}
