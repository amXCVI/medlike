import 'package:flutter/material.dart';

class HealthNodata extends StatelessWidget {
  const HealthNodata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/empty_indicator.png'),
          const SizedBox(height: 50,),
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
      ),
    );
  }
}
