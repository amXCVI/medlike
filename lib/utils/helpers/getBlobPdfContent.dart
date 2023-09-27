import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:universal_html/html.dart' as html;
import 'package:http/http.dart' as http;

/// Возвращает pdf файл (Blob)
Future<html.Blob> getBlobPdfContent(String pdfUrl) async {
  http.Response response = await http.get(Uri.parse(pdfUrl), headers: {
    'Authorization':
        'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
  });
  var pdfData = response.bodyBytes;
  final blob = html.Blob([pdfData], 'application/pdf');

  return blob;
}

Future<void> openPdfInNewTab(String pdfUrl) async {
  final url = html.Url.createObjectUrlFromBlob(await getBlobPdfContent(pdfUrl));
  html.window.open(url, "_blank");
  html.Url.revokeObjectUrl(url);
}
