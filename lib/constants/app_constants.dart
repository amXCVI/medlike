class AppConstants {
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  // Ключ для проверки авторизации
  //! нужно бы переделать на какой-то сервис, по-хорошему
  static const String isAuth = 'isAuth';

  // Ключ для сохранения номера телефона пользователя
  static const String userPhoneNumber = 'userPhoneNumber';

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

  // Время таймаута. Приложение автоматически выкидывает пользователя после буздействия
  static const int timeoutDurationMinutes = 5;

  // Id документа, который проверяется и подтверждается при первой авторизации
  static const int actualUserAgreement = 4;

  // Ключ для хранения предпочитаемого метода авторизации
  static const String useBiometricMethodAuthentication =
      'useBiometricMethodAuthentication';

  // временный ID для загружаемых файлов (для лоадера)
  static const String uploadingFileId = 'loadingFile';

  // Тип оплаты, по которому не отображать способы оплаты, только нал
  static const String noPayedPayType = 'budget';

  // Тип оплаты, картой
  static const String cardPayType = 'cash';
}

// Способы авторизации
enum SelectedAuthMethods { faceId, touchId, undefined, pinCode }
