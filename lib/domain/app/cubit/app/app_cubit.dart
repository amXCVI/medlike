import 'package:bloc/bloc.dart';

part 'app_state.dart';

/// Кубит для всяких вспомогательных штуковин.
/// Чтобы не засорять UserCubit ими
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

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
