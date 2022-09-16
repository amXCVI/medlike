import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key, this.phonesList}) : super(key: key);

  final List<String>? phonesList;

  Future<void> _makePhoneCall(String phoneNumber) async {
    RegExp exp = RegExp(r"[^0-9]+");

    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber.replaceAll(exp, ''),
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return phonesList!.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/clinics/ic_doc_oval-1.svg'),
                const SizedBox(width: 16),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Контакты',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 3),
                      ...phonesList!
                          .map((item) => GestureDetector(
                                onTap: () => {_makePhoneCall(item)},
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  child: Text(item,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: AppColors.mainOther)),
                                ),
                              ))
                          .toList()
                    ]),
              ],
            ),
          )
        : const SizedBox();
  }
}
