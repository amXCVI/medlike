import 'package:flutter/material.dart';

class HealthNodata extends StatelessWidget {
  const HealthNodata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/empty_indicator.png'),
        const Text(
          'Здесь будет список \nваших показателей здоровья',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(158, 157, 157, 1)
          ),
        )
      ]
    );
  }
}
