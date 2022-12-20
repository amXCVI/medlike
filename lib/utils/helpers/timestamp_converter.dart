import 'package:freezed_annotation'
    '/freezed_annotation.dart';
import 'package:intl/intl.dart';

class TimestampConverter implements JsonConverter<DateTime, String> {
  const TimestampConverter();

  @override
  DateTime fromJson(String timestamp) {
    var df = DateFormat("yyyy-MM-ddTHH:mm:ssz");
    return df.parse(timestamp);
  }

  @override
  String toJson(DateTime date) => date.toIso8601String();
}
