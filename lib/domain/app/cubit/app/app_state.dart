part of 'app_cubit.dart';

class AppState {
  final bool? isOpenedWebMenu;

  AppState({
    this.isOpenedWebMenu,
  });

  AppState copyWith({
    bool? isOpenedWebMenu,
  }) {
    return AppState(
      isOpenedWebMenu: isOpenedWebMenu ?? this.isOpenedWebMenu,
    );
  }
}
