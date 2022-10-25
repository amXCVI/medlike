import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/themes/colors.dart';

class NotFoundAppointment extends StatelessWidget {
  const NotFoundAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleTapAppointments() {
      context.router.pushNamed(AppRoutes.subscribeProfiles);
    }

    return GestureDetector(
      onTap: _handleTapAppointments,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.homeCategoriesGradientColor1,
              // AppColors.homeCategoriesGradientColor2,
              AppColors.homeCategoriesGradientColor3,
            ],
            stops: [0, 1],
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Image.asset(
                    'assets/icons/main_page/ic_main_button_three@2x.png',
                    width: 100)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'У вас нет предстоящих приемов',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  'Но это легко исправить, \nзаписавшись к нужному \nспециалисту',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.lightText),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
