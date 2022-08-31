import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key, required this.imgPath, required this.label})
      : super(key: key);

  final String imgPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: SizedBox(
            height: 100,
          ),
        ),
        Image.asset(
          imgPath,
          width: 265,
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: 50,
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
    );
  }
}
