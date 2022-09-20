import 'package:flutter/material.dart';
import 'package:medlike/widgets/not_found_data/empty_list_widget.dart';

class NotFoundUserFiles extends StatelessWidget {
  const NotFoundUserFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmptyListWidget(
      label: 'Здесь будет список ваших файлов',
      imgPath: 'assets/images/empty_files.png',
    );
  }
}
