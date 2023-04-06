import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/prompt/prompt_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/utils/helpers/resume_helper.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class InactivityManager extends StatefulWidget {
  const InactivityManager({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<InactivityManager> createState() => _InactivityManagerState();
}

class _InactivityManagerState extends State<InactivityManager> with WidgetsBindingObserver {
  late Timer _timer = Timer(const Duration(hours: 1), () {});
  late bool isLogoutApp = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _initializeTimer();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if(state != AppLifecycleState.resumed) {
      await UserSecureStorage.setField(AppConstants.timeoutStart, DateTime.now().toString());
      context.read<PromptCubit>().unselect();
    } else {
      final isBlocked = await ResumeHelper.isAppBlocked();
      //UserSecureStorage.deleteField(AppConstants.timeoutStart);
      if(isBlocked) {
        _logOutUser();
      } else {
        ResumeHelper.resume();
      }
    }
  }

  void _initializeTimer() {
    _timer = Timer.periodic(
        const Duration(
            minutes: kDebugMode ? 60 : AppConstants.timeoutDurationMinutes),
        (_) => {_logOutUser()});
  }

  void _logOutUser() {
    context.read<PromptCubit>().unselect();
    setState(() {
      isLogoutApp = true;
    });
    _timer.cancel();
  }

  void _handleUserInteraction([_]) {
    ResumeHelper.resume();
    if (!_timer.isActive) {
      return;
    }

    _timer.cancel();
    _initializeTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    if (isLogoutApp) {
      print('LOGOUT');
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
