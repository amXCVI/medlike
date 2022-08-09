class ValueHelper {
  /// Преобразует значение параметра здоровья,
  /// состоящее либо из одного или двух чисел
  /// в строку 
  static String getStringFromValues(List<double> innerData, int decimalDigits) {
    if(innerData.length > 1) {
      return '${innerData[0].toStringAsFixed(decimalDigits)}/${innerData[1].toStringAsFixed(decimalDigits)}';
    } else {
      return innerData[0].toStringAsFixed(decimalDigits);
    }
  }
}
