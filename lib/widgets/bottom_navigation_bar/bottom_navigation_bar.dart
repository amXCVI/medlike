import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/widgets/icon_with_bottom_label/icon_with_bottom_label.dart';
import 'package:medlike/widgets/main_menu/main_menu.dart';
import 'package:medlike/widgets/user_profiles_list/user_profiles_list.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key, this.rightBottomWidget}) : super(key: key);

  final Widget? rightBottomWidget;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 56,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Theme.of(context).dividerColor),
            ),
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).dividerColor,
                blurRadius: 1,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      context: context,
                      builder: (context) => Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12)),
                              color: Theme.of(context).colorScheme.background,
                            ),
                            child: Column(
                              children: [
                                const UserProfilesList(),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color:
                                              Theme.of(context).dividerColor),
                                    ),
                                  ),
                                ),
                                const MainMenu(),
                              ],
                            ),
                          ));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: IconWithBottomLabel(
                  icon: SvgPicture.asset(
                      'assets/icons/bottom_nav_bar/ic_menu_outline.svg'),
                  label: 'Меню',
                ),
              ),
              // icon: SvgPicture.asset('assets/icons/bottom_nav_bar/ic_menu_outline.svg')),
              rightBottomWidget ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
