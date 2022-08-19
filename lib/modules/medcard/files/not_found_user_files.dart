import 'package:flutter/material.dart';
import 'package:medlike/widgets/subscribe_not_found_data/subscribe_not_found_data.dart';

class NotFoundUserFiles extends StatelessWidget {
  const NotFoundUserFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset('assets/images/empty_files.png'),
          const SubscribeNotFoundData(
              text: 'Здесь будет список ваших файлов'),
        ],
      ),
    );
  }
}
