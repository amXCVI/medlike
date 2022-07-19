class AppConstants {
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  static const yandexApiKey = '492944f6-afb1-4915-bebe-6a3639caf540';

  // Ключ для проверки авторизации
  //! нужно бы переделать на какой-то сервис, по-хорошему
  static const String isAuth = 'isAuth';

  // Ключ для сохранения последнего активного профиля в security storage
  static const String selectedUserId = 'selectedUserId';

  // Ключ Яндекс.карты
  static const String yandexMapApiKey = '492944f6-afb1-4915-bebe-6a3639caf540';

  // Ключ для сохранения часового пояса выбранной клиники
  static const String timeZoneOffset = 'timeZoneOffset';

  // Ключ для входа по пин-коду или по паролю
  static const String isSavedPinCodeForAuth = 'isSavedPinCodeForAuth';

  // Ключ для хранения хэша пин-кода
  static const String authPinCode = 'authPinCode';
}
