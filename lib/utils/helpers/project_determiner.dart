import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:medlike/constants/app_constants.dart';

class ProjectDeterminer {
  static Projects getProjectType() {
    /// Простое web-приложение
    if (kIsWeb) {
      return Projects.WEB;
    }

    /// Стандартный Android-проект
    if (Platform.isAndroid) {
      return Projects.ANDROID;
    }

    /// Стандартный IOS-проект
    if (Platform.isIOS) {
      return Projects.IOS;
    }

    return Projects.UNDEFINED;
  }
}
