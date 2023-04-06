import 'package:flutter_test/flutter_test.dart';
import 'package:medlike/app.dart';
import 'package:medlike/widgets/pin_code/pin_code_view.dart';

import '../../test_init.dart';

void main() {
  testWidgets('Pincode test', (WidgetTester tester) async {
    testInit();
    await tester.runAsync(() async {
      await tester.pumpWidget(
        App(), 
        const Duration(seconds: 1)
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
    var appointmentConfirmWidget = find.byType(PinCodeView);

    expect(appointmentConfirmWidget, findsOneWidget);
  });
}
