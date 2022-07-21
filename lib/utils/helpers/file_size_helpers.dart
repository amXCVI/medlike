class FileSizeHelper {
  static String converterBytesToKbOrMb(int bytesSize) {
    double size = bytesSize / 1024;
    if (size >= 100) {
      return('${(size / 1024).toStringAsFixed(1)} MB') ;
    } else {
      return '${size.toStringAsFixed(1)} KB';
    }

  }
}