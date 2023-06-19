import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/navigation/router.dart';

class EsiaLoginButton extends StatelessWidget {
  const EsiaLoginButton({Key? key}) : super(key: key);

  Future<void> handleTapOnEsiaLogin(BuildContext context) async {
    context.router.push(const EsiaLoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handleTapOnEsiaLogin(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 20),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: SvgPicture.asset('assets/icons/login/ic_gosuslugi_filled.svg'),
      ),
    );
  }
}
