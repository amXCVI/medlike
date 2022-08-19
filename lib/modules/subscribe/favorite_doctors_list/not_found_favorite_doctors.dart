import 'package:flutter/material.dart';
import 'package:medlike/widgets/subscribe_not_found_data/subscribe_not_found_data.dart';

class NotFoundFavoriteDoctors extends StatelessWidget {
  const NotFoundFavoriteDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset('assets/images/not_found_favorite_doctors.png'),
          const SubscribeNotFoundData(
              text: 'Здесь будет список избранных врачей'),
        ],
      ),
    );
  }
}
