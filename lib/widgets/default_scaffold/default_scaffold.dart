import 'package:flutter/material.dart';
import 'package:medlike/widgets/app_bar/auth_app_bar/auth_app_bar.dart';
import 'package:medlike/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    Key? key,
    required this.child,
    required this.appBarTitle,
    this.isChildrenPage = false,
  }) : super(key: key);
  final Widget child;
  final String appBarTitle;
  final bool isChildrenPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(title: appBarTitle, isChildrenPage: isChildrenPage),
      bottomNavigationBar: const BottomBar(),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.only(left: 0, top: 6, right: 0, bottom: 0),
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(28)),
              boxShadow: [
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(28)),
              ),
            )),
        child
      ]),
    );
  }
}
