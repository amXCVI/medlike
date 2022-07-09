import 'package:flutter/material.dart';
import 'package:medlike/modules/medcard/filters_list.dart';
import 'package:medlike/modules/medcard/medcard_list.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class MedcardPage extends StatelessWidget {
  const MedcardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        appBarTitle: 'Медкарта',
        child: Column(
          children: const [
            MedcardFiltersList(),
            MedcardList(),
          ],
        ));
  }
}
