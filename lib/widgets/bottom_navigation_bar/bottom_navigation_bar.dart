import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/widgets/icon_with_bottom_label/icon_with_bottom_label.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:medlike/widgets/main_menu/main_menu.dart';
import 'package:medlike/widgets/main_menu/main_menu_items_list.dart';
import 'package:medlike/widgets/main_menu/menu_item.dart';
import 'package:medlike/widgets/user_profiles_list/user_profiles_list.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {
                showModalBottomSheet(
                    // isScrollControlled: true,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12.0),
                      ),
                    ),
                    builder: (context) {
                      return Column(
                        children: const [
                          UserProfilesList(),
                          MainMenu(),
                        ],
                      );
                    });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: IconWithBottomLabel(
                icon: SvgPicture.asset(
                    'assets/icons/bottom_nav_bar/ic_menu_outline.svg'),
                label: 'Menu',
              ),
            ),
            // icon: SvgPicture.asset('assets/icons/bottom_nav_bar/ic_menu_outline.svg')),
          ],
        ),
      ),
    );
  }
}