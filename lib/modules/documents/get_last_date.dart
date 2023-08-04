/// Возвращает самую последнюю дату из трех.
DateTime getLastDate({
  required DateTime dateOne,
  DateTime? dateTwo,
  DateTime? dateThree,
}) {
  if (dateThree != null && dateTwo != null) {
    if (dateThree.isAfter(dateOne) && dateThree.isAfter(dateTwo)) {
      return dateThree;
    }
    if (dateTwo.isAfter(dateOne) && dateTwo.isAfter(dateThree)) {
      return dateTwo;
    }
    return dateOne;
  }
  if (dateTwo != null) {
    if (dateTwo.isAfter(dateOne)) {
      return dateTwo;
    } else {
      return dateOne;
    }
  }
  if (dateThree != null) {
    if (dateThree.isAfter(dateOne)) {
      return dateThree;
    } else {
      return dateOne;
    }
  }
  return dateOne;
}
