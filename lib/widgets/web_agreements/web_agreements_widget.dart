import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class WebAgreementsWidget extends StatelessWidget {
  const WebAgreementsWidget({Key? key, required this.htmlBody})
      : super(key: key);

  final String htmlBody;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: HtmlWidget(
        htmlBody,
        onTapUrl: (url) async {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          } else {
            AppToast.showAppToast(msg: 'Не удалось откыть файл $url');
          }
          return Future(() => true);
        },
        customStylesBuilder: (element) {
          if (element.classes.contains('agreement-link')) {
            return {'display': 'flex'};
          }
          if (element.classes.contains('agreement-li-item')) {
            return {'margin-bottom': '12px'};
          }
          if (element.classes.contains('first-letter')) {
            return {'display': 'none'};
          }
          return null;
        },
      ),
    );
  }
}
