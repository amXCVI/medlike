import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:medlike/utils/relogin_manager/relogin_manager.dart';
import 'package:medlike/widgets/app_bar/auth_app_bar/auth_app_bar.dart';
import 'package:medlike/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:medlike/widgets/default_clip_r_rect/default_clip_r_rect.dart';
import 'package:medlike/widgets/default_scaffold/app_version_checker.dart';

class DefaultScaffold extends StatefulWidget {
  const DefaultScaffold({
    Key? key,
    required this.child,
    required this.appBarTitle,
    this.isChildrenPage = true,
    this.actionButton,
    this.appBarSubtitle = '',
    this.isSearch = false,
    this.filteringFunction,
    this.bottomNavigationBar,
    this.onPressedAppLogo,
    this.actions,
    this.appBar,
    this.rightBottomWidget,
    this.widgetOverBody,
    this.widgetOverBodyGlobalKey,
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
  final Widget? widgetOverBody;
  final GlobalKey? widgetOverBodyGlobalKey;

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  double widgetOverBodyHeight = 0;

  void postFrameCallback(_) {
    if (widget.widgetOverBodyGlobalKey == null) {
      setState(() {
        widgetOverBodyHeight = 0;
      });
      return;
    }
    var context = widget.widgetOverBodyGlobalKey!.currentContext;
    if (context == null) return;

    Size? newSize = context.size;

    if (widgetOverBodyHeight == newSize?.height) return;
    setState(() {
      widgetOverBodyHeight = (newSize?.height ?? 20) - 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    const Duration _bodyTopPaddingAnimatedDuration =
        Duration(milliseconds: 250);

    return Scaffold(
      appBar: widget.appBar ??
          CustomAppBar(
            title: widget.appBarTitle,
            subtitle: widget.appBarSubtitle,
            isChildrenPage: widget.isChildrenPage,
            isSearch: widget.isSearch,
            actions:
                widget.actions != null ? widget.actions as List<Widget> : [],
            filteringFunction: widget.filteringFunction,
            onPressedAppLogo: widget.onPressedAppLogo,
          ),
      bottomNavigationBar: widget.bottomNavigationBar ??
          BottomBar(rightBottomWidget: widget.rightBottomWidget),
      body: Stack(children: [
        widget.widgetOverBody ?? const SizedBox(),
        AnimatedPadding(
          padding: EdgeInsets.only(
              left: 0, top: widgetOverBodyHeight + 6, right: 0, bottom: 0),
          duration: _bodyTopPaddingAnimatedDuration,
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
        AnimatedPadding(
            padding: EdgeInsets.only(
                left: 0, top: widgetOverBodyHeight + 6, right: 0, bottom: 35),
            duration: _bodyTopPaddingAnimatedDuration,
            child: Container(
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(28)),
              ),
            )),
        AnimatedPadding(
          padding: EdgeInsets.only(
              left: 0, top: widgetOverBodyHeight + 7, right: 0, bottom: 0),
          duration: _bodyTopPaddingAnimatedDuration,
          child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
              ),
              child: DefaultClipRRect(child: widget.child)),
        ),

        /// Блокировка экрана по неактивности пользователя
        // const UnAuthChecker(),
        const AppVersionChecker(),
        const ReloginManager(),
        // const PushRedirecter()
      ]),
      floatingActionButton: widget.actionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
