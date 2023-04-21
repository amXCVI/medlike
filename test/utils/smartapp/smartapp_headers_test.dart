import 'package:flutter_test/flutter_test.dart';
import 'package:medlike/utils/helpers/smartapp/clients_headers_helper.dart';

void main() {
  test('Smartapp headers user-agent', () {
    final noAddHeaders = getHeadersHelper(
      'test_token',
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36'
    );

    expect(noAddHeaders, {
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',
      'Accept': 'application/json; charset=utf-8',
      'Content-Type': 'application/json',
      'Project': 'Zapolyarye',
      'VerApp': '1.1',
      'Platform': '6',
      'Authorization': 'test_token'
    });

    final addHeaders = getHeadersHelper(
      'test_token',
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', 
      headers: {
        'Authorization': 'test_smartapp_token'
      }
    );

    expect(addHeaders, {
      'Authorization': 'test_smartapp_token',
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',
      'Platform': '6'
    });
  });
}
