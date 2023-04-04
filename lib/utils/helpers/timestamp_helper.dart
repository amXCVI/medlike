int getTimezoneOffset(String appointmentDateTime) {
  return int.parse(appointmentDateTime.split('+').last.substring(0, 2));
}

bool isDifferenceIn24h(DateTime target, {
  DateTime? base
}) {
  final diff = 
    target.difference(base ?? DateTime.now());

  return diff.inMicroseconds <= const Duration(hours: 24).inMicroseconds;
}
