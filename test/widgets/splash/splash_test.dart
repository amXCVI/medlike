import 'package:flutter_test/flutter_test.dart';
import 'package:medlike/app.dart';
import 'package:medlike/modules/main_page/splash_page.dart';

import '../../test_init.dart';

void main() {
  testWidgets('Splash page test', (WidgetTester tester) async {
    testInit();

    await tester.pumpWidget(
      App(), 
      const Duration(seconds: 30)
    );
    var appointmentConfirmWidget = find.byType(SplashPage);

    expect(appointmentConfirmWidget, findsOneWidget);
  });
}
