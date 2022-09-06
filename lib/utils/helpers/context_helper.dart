import 'package:flutter/material.dart';
 
class ContextHelper {
  // Takes a key, and in 1 frame, returns the size of the context attached to the key
  static void getFutureSizeFromGlobalKey(GlobalKey key, Function(Size size) callback) {
    Future.delayed(const Duration(milliseconds: 100), () {
      Size? size = getSizeFromContext(key.currentContext);
      if (size != null) {
        callback(size);
      } else {
        getFutureSizeFromGlobalKey(key, callback);
      }
    });
  }
 
  // Shortcut to get the renderBox size from a context
  static Size? getSizeFromContext(BuildContext? context) {
    final rb = context?.findRenderObject() as RenderBox?;
    return rb?.size;
  }
 
  // Shortcut to get the global position of a context
  static Offset? getOffsetFromContext(BuildContext context, [Offset? offset]) {
    final rb = context.findRenderObject() as RenderBox?;
    return rb?.localToGlobal(offset ?? Offset.zero);
  }
}
