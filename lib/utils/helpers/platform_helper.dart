import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformHelper {
  static String getPlatform() {
    return kIsWeb 
      ? 'Web'
      : Platform.isAndroid ? 'Android' : 'FlutteriOS';
  }
}
