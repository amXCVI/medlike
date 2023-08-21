import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

@RoutePage()
class FaqItemPage extends StatelessWidget {
  const FaqItemPage({Key? key, required this.question, required this.answer})
      : super(key: key);

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        appBarTitle: question,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                MarkdownBody(data: answer),
              ],
            ),
          ),
        ));
  }
}
