class ApiConstants {
  static String baseUrlEnv01 = 'https://tgn.medotrade.ru:23340/medlike/env01';
  static String baseUrlEnv04 = 'https://tgn.medotrade.ru:23340/medlike/env04';
  static String baseUrlEnv05 = 'https://tgn.medotrade.ru:23340/medlike/env05';
  static String baseUrlEnv11 = 'https://tgn.medotrade.ru:23340/medlike/env11';

  static String baseUrlZapolyaryeProd =
      'https://mis-api.nornik.ru/medlike/prod';

  static String baseUrl = baseUrlEnv11;

  // Версия приложения. Когда-нибудь нужно сделать, чтобы эта штука подтягивалась автоматически
  static String appVersion = '1.1';

  // Окружение
  static String env = 'Zapolyarye';

  static List<String> sha256 = [
    '1F:62:98:94:92:E4:EA:81:B1:7D:79:FC:7B:47:DA:AD:E1:CC:45:D0:F9:99:E4:59:B5:2C:F0:E4:87:E8:6D:C2',
    'ED:CC:84:D0:4E:4B:E0:D3:1C:9F:0E:F7:3F:3E:51:52:C1:9E:48:F8:F3:AC:EC:E8:3D:50:7F:EF:20:A7:90:6A',
    '24:9F:91:6C:04:35:29:37:B0:FA:5F:42:7B:18:85:A6:5E:A2:D3:18:6F:44:35:E3:DA:68:FB:B5:26:3D:53:70',
    //'24:9f:91:6c:04:35:29:37:b0:fa:5f:42:7b:18:85:a6:5e:a2:d3:18:6f:44:35:e3:da:68:fb:b5:26:3d:53:70'
  ];
}
