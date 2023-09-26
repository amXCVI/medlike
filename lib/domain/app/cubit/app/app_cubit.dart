import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:medlike/utils/media/media_queryes.dart';

part 'app_state.dart';

/// Кубит для всяких вспомогательных штуковин.
/// Чтобы не засорять UserCubit ими
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  /// Закрывает менб слева при инициализации на мелких экранах. Чтобы оно не закрывало все на свете
  void closeWebMenuInitial(BuildContext context) {
    if (AppMediaQuery.isDesktop(context) || state.isOpenedWebMenu == true) {
      return;
    }

    emit(state.copyWith(
      isOpenedWebMenu: false,
    ));
  }

  /// Закрывает меню слева
  void closeWebMenu() {
    emit(state.copyWith(
      isOpenedWebMenu: false,
    ));
  }

  /// Открывает меню слева
  void openWebMenu() {
    emit(state.copyWith(
      isOpenedWebMenu: true,
    ));
  }

  /// Открывает или закрывает меню слева в зависимости от его состояния
  void clickOnWebMenu() {
    emit(state.copyWith(
      isOpenedWebMenu:
          state.isOpenedWebMenu == null || state.isOpenedWebMenu == true
              ? false
              : true,
    ));
  }
}
