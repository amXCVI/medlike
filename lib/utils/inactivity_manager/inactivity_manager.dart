import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';

class InactivityManager extends StatefulWidget {
  const InactivityManager({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<InactivityManager> createState() => _InactivityManagerState();
}

class _InactivityManagerState extends State<InactivityManager> {
  late Timer _timer = Timer(const Duration(hours: 1), () {});
  late bool isLogoutApp = false;

  @override
  void initState() {
    super.initState();

    _initializeTimer();
  }

  void _initializeTimer() {
    _timer = Timer.periodic(
        const Duration(minutes: AppConstants.timeoutDurationMinutes),
        (_) => {_logOutUser()});
  }

  void _logOutUser() {
    setState(() {
      isLogoutApp = true;
    });
    _timer.cancel();
  }

  void _handleUserInteraction([_]) {
    if (!_timer.isActive) {
      return;
    }

    _timer.cancel();
    _initializeTimer();
  }

  @override
  Widget build(BuildContext context) {
    if (isLogoutApp) {
      print('LOGOUT');
      //! Не представляю, как здесь сделать редирект на страницу с пин-кодом
      context.read<UserCubit>().signOut();
      _initializeTimer();
    }

    return Listener(
      onPointerDown: _handleUserInteraction, // best place to reset timer imo
      onPointerMove: _handleUserInteraction,
      onPointerUp: _handleUserInteraction,
      child: widget.child,
    );
  }
}
