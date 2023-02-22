import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/prompt/prompt_cubit.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class InactivityManager extends StatefulWidget {
  const InactivityManager({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<InactivityManager> createState() => _InactivityManagerState();
}

class _InactivityManagerState extends State<InactivityManager>
    with WidgetsBindingObserver {
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
    const dur = Duration(
        minutes: kDebugMode ? 60 : AppConstants.timeoutDurationMinutes);

    if (state != AppLifecycleState.resumed) {
      await UserSecureStorage.setField(
          AppConstants.timeoutStart, DateTime.now().toString());
      context.read<PromptCubit>().unselect();
    } else {
      final time = DateTime.tryParse(
          await UserSecureStorage.getField(AppConstants.timeoutStart) ?? '');
      if (time == null || DateTime.now().difference(time) >= dur) {
        _logOutUser();
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
    if (!_timer.isActive) {
      return;
    }

    _timer.cancel();
    _initializeTimer();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    if (isLogoutApp) {
      /// Убираем логаут по истеечнии времени
      // context.read<UserCubit>().signOut();
      _initializeTimer();
    }

    return BlocListener<UserCubit, UserState>(
      listenWhen: ((previous, current) => 
        previous.tokenTryCount != current.tokenTryCount
      ),
      listener: (context, state) {
        print('######## Кол-во предыдущих попыток: ${state.tokenTryCount} ###########');
        if(state.tokenTryCount > 1) {
          context.router.replace(const WrongLoginRoute());
        }
      },
      /// Два вложенных слушателя это плохо, 
      /// но надо четко отделить логику одного от логика другого
      child: BlocListener<UserCubit, UserState>(
        listenWhen: ((previous, current) => 
          previous.getSmartappTokenStatus != current.getSmartappTokenStatus
        ),
        listener: (context, state) {
          if(state.getSmartappTokenStatus == GetSmartappTokenStatuses.wrongJWT) {
            print('######## Пробуем получить JWT токен еще раз ###########');
            context.router.replace(SmartappLoginRoute());
          }
        },
        child: Listener(
          onPointerDown: _handleUserInteraction, // best place to reset timer imo
          onPointerMove: _handleUserInteraction,
          onPointerUp: _handleUserInteraction,
          child: widget.child,
        ),
      ),
    );
  }
}
