import 'package:medlike/utils/api/api_constants.dart';

class AppConstants {
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  // Ключ для проверки авторизации
  //! нужно бы переделать на какой-то сервис, по-хорошему
  static const String isAuth = 'isAuth';

  // Ключ для сохранения номера телефона пользователя
  static const String userPhoneNumber = 'userPhoneNumber';

  // Ключ для показа bottomSheet со стартовой информацией
  static const String startBottomSheetShowed = 'startBottomSheetShowed';

  // Ключ для пользовательских соглашений. Подписаны или нет.
  static const String isAcceptedAgreements = 'isAcceptedAgreements';

  // Ключ для сохранения статуса пользования приложением
  static const String demoTourStatus = 'demoTourStatus';

  // Ключ для сохранения последнего активного профиля в security storage
  static const String selectedUserId = 'selectedUserId';

  // Ключ для сохранения JSON с фильтрами показателей здоровья
  static const String healthFilters = 'healthFilters';

  // Ключ Яндекс.карты
  //! Не наш ключ!!! Нашел в гугле!!! Наш не работает!!!
  static const String yandexMapApiKey = 'c0d403ab-e5be-4049-908c-8122a58acf23';

  // access token для карт mapbox
  static const String mapBoxApiKey =
      'pk.eyJ1IjoiemFwb2x5YXJ5ZSIsImEiOiJjbDc3bmJjdWswMWpiM29zNmo2OGoycDI4In0.9-BixC9CCxdi5VrXwmn2-Q';

  // Ключ для сохранения часового пояса выбранной клиники
  static const String timeZoneOffset = 'timeZoneOffset';

  // Ключ для входа по пин-коду или по паролю
  static const String isSavedPinCodeForAuth = 'isSavedPinCodeForAuth';

  // Ключ для хранения хэша пин-кода
  static const String authPinCode = 'authPinCode';

  // Время таймаута. Приложение автоматически выкидывает пользователя после бездействия
  static const int timeoutDurationMinutes = 5;

  // Время блокировки приложения
  static const String timeoutStart = 'timeoutStart';

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

  // Человекочитаемое название приложения
  static const appName = 'Z-Clinic';

  // Размер экрана для iPhone SE. Используется в верстке, уникальные случаи
  static const int smScreenWidth = 330;

  //  Samsung S10 Viewport height
  static const int mdScreenHeight = 760;

  // Количество попыток ввода пользовательского кода (графического ключа, пин-кода, биометрической информации)
  static const int countLoginAttemps = 5;

  // Ключ, проверяет актуальная версия приложения установлена или нет.
  // Меняется в интерсепторе, проверяется в Guards
  static const String isActualAppVersion = 'true';

  // Ширина открытого и закрытого меню для веб-проектов
  static const double webMenuOpenedWidth = 300;
  static const double webMenuClosedWidth = 100;

  // Высота аппбара для веб-проектов
  static const double webAppBarHeight = 80;

  static String esiaOAuthPageURL = '${ApiConstants.baseUrl}/esia/login';
}

// Способы авторизации
enum SelectedAuthMethods { faceId, touchId, undefined, pinCode }

// Перечень проектов
enum Projects { IOS, ANDROID, WEB, SMARTAPP, UNDEFINED }
