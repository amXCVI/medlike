import 'dart:io';

import 'package:medlike/widgets/fluttertoast/toast.dart';

bool checkConstraints(File file) {
  int sizeInBytes = file.lengthSync();
  double sizeInMb = sizeInBytes / (1024 * 1024);
  if (sizeInMb > 10) {
    AppToast.showAppToast(msg: 'Размер файла не должен превышать 10Мб');
    return false;
  }
  String extension = file.path.substring(file.path.lastIndexOf('.') + 1);
  if (!['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx', 'rtf', 'txt']
      .contains(extension)) {
    AppToast.showAppToast(msg: 'Данный тип файлов не поддерживается');
    return false;
  }
  return true;
}
