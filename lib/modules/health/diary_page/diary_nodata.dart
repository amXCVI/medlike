import 'package:flutter/material.dart';

class DiaryNodata extends StatelessWidget {
  const DiaryNodata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 100
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/empty_medcard.png'),
          const SizedBox(height: 50,),
          const Text(
            'Здесь будет график вашего показателя здоровья',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(158, 157, 157, 1)
            ),
          )
        ]
      ),
    );
  }
}
