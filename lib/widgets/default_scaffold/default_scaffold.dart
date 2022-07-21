import 'package:flutter/material.dart';
import 'package:medlike/widgets/app_bar/auth_app_bar/auth_app_bar.dart';
import 'package:medlike/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:medlike/widgets/default_clip_r_rect/default_clip_r_rect.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    Key? key,
    required this.child,
    required this.appBarTitle,
    this.isChildrenPage = false,
    this.actionButton,
    this.appBarSubtitle = '',
    this.isSearch = false,
    this.filteringFunction,
    this.bottomNavigationBar,
    this.onPressedAppLogo,
    this.actions,
    this.appBar,
    this.rightBottomWidget,
  }) : super(key: key);
  final Widget child;
  final String appBarTitle;
  final String appBarSubtitle;
  final bool isChildrenPage;
  final Widget? actionButton;
  final Widget? bottomNavigationBar;
  final bool isSearch;
  final List<Widget>? actions;
  final void Function(String searchingStr)? filteringFunction;
  final void Function()? onPressedAppLogo;
  final PreferredSizeWidget? appBar;
  final Widget? rightBottomWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          CustomAppBar(
            title: appBarTitle,
            subtitle: appBarSubtitle,
            isChildrenPage: isChildrenPage,
            isSearch: isSearch,
            actions: actions != null ? actions as List<Widget> : [],
            filteringFunction: filteringFunction,
            onPressedAppLogo: onPressedAppLogo,
          ),
      bottomNavigationBar: bottomNavigationBar ??
          BottomBar(rightBottomWidget: rightBottomWidget),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.only(left: 0, top: 6, right: 0, bottom: 0),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(28)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
        Container(
            padding:
                const EdgeInsets.only(left: 0, top: 6, right: 0, bottom: 35),
            child: Container(
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(28)),
              ),
            )),
        Container(
            padding:
                const EdgeInsets.only(left: 0, top: 7, right: 0, bottom: 0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            child: DefaultClipRRect(child: child)),
      ]),
      floatingActionButton: actionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
