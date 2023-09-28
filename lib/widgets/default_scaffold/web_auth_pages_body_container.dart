import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/media/media_queryes.dart';

class WebAuthPagesBodyContainer extends StatelessWidget {
  const WebAuthPagesBodyContainer({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppMediaQuery.isDesktop(context)
            ? SizedBox(
                width: MediaQuery.of(context).size.height / 2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      'assets/assets/images/login_background.jpg',
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'assets/assets/images/full_logo.png',
                      height: 250,
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Container(
                width: AppMediaQuery.isDesktop(context)
                    ? 620
                    : MediaQuery.of(context).size.width - 32,
                height: 768,
                padding: EdgeInsets.all(
                    AppMediaQuery.isDesktop(context) ? 100 : 16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  border: Border.all(color: AppColors.lightBrand),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                child: SingleChildScrollView(child: child),
              ),
              const WebAuthPageBottomNavigationBar(),
            ],
          ),
        ),
      ],
    );
  }
}

class WebAuthPageBottomNavigationBar extends StatelessWidget {
  const WebAuthPageBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleTapOnSupport() {
      context.router.push(const UnauthSupportRoute());
    }

    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 24),
      child: TextButton(
        onPressed: handleTapOnSupport,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Нужна помощь? Обратитесь в ',
            style: Theme.of(context).textTheme.bodySmall,
            children: <TextSpan>[
              TextSpan(
                  text: 'Техподдержку',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.mainBrandColor)),
            ],
          ),
        ),
      ),
    );
  }
}
