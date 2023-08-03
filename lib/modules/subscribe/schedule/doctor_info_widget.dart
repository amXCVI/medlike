import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DoctorInfoWidget extends StatelessWidget {
  const DoctorInfoWidget({Key? key, required this.markdownSource})
      : super(key: key);

  final String? markdownSource;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Информация о враче',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          MarkdownBody(data: markdownSource ?? ''),
        ],
      ),
    );
  }
}
