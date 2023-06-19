import 'package:flutter_test/flutter_test.dart';
import 'package:medlike/utils/helpers/timestamp_helper.dart';

void main() {
  test('Timezone difference', () {
    const firstStrDate = '2023-04-04T17:00:00+03:00';
    const secondStrDate = '2023-04-05T09:20:00+07:00';

    final tzOffset = getTimezoneOffset(firstStrDate);
    final tzOffsetSecond = getTimezoneOffset(secondStrDate);

    expect(tzOffset, 3);
    expect(tzOffsetSecond, 7);
  });
}
