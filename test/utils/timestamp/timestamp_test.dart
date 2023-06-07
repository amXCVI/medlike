import 'package:flutter_test/flutter_test.dart';
import 'package:medlike/utils/helpers/timestamp_helper.dart';

void main() {
  test('Timezone difference', () {
    const firstStrDate = '2023-04-04T17:00:00+03:00';
    const secondStrDate = '2023-04-05T09:20:00+07:00';

    final firstDate = DateTime.parse(firstStrDate);
    final secondDate = DateTime.parse(secondStrDate);

    const baseStrDate = '2023-04-04T09:20:00+03:00';
    final baseDate = DateTime.parse(baseStrDate);

    final now = isDifferenceIn24h(DateTime.now());

    expect(now, true);

    final first = isDifferenceIn24h(firstDate, base: baseDate);
    final second = isDifferenceIn24h(secondDate, base: baseDate);

    expect(first, true);
    expect(second, true);
  });
}
