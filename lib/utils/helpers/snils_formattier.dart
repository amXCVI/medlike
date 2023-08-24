class SnilsString {
  static String defaultFormattier(String snils) {
    return (snils.replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d{3})(\d+)'),
        (Match m) => "${m[1]}-${m[2]}-${m[3]} ${m[4]}"));
  }
}
