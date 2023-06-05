import 'package:permission_handler/permission_handler.dart';

class PermissionsHelper {
  static Future<bool> getNotificationPermission() async {
    //? Почему false без окна запроса
    //? Где вызывается
    final notificationsIsGranted = await Permission.notification.request().isGranted;
    const notification = Permission.notification;
    final a = await notification.isPermanentlyDenied;
    final b = await notification.isLimited;
    final c = await notification.isDenied;
    final d = await notification.isRestricted;
    return notificationsIsGranted;
  }
}
