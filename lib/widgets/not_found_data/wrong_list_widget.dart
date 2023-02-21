import 'package:flutter/material.dart';

class WrongListWidget extends StatelessWidget {
  const WrongListWidget({
    Key? key, 
    required this.imgPath, 
    required this.title,
    required this.label
  }): super(key: key);

  final String imgPath;
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgPath,
            width: 265,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
          ),
          Text(title,
            style: Theme.of(context).textTheme.headlineMedium
          ),
          SizedBox(
            height: 12,
            width: MediaQuery.of(context).size.width,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(158, 157, 157, 1)),
          )
        ],
      ),
    );
  }
}
