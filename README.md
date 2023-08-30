# Medlike

## Полезные команды
### Сборка проекта
[ ] Cборка проекта под web: flutter build web --web-renderer canvaskit --release --dart-define=FLUTTER_WEB_USE_SKIA=true
[ ] Cборка проекта под android: flutter build apk --release.

### Конфигурирование и генерация
[ ] Конфигурирование:  firebase  в проекте: flutterfire configure
[ ] Автогенерация: flutter pub run build_runner build --delete-conflicting-outputs

### Тестирование
[ ] Отправка в тестирование:
    [ ] Андроид: '''$ firebase appdistribution:distribute build/app/outputs/flutter-apk/app-release.apk --app 1:1083145779008:android:4b162a5ecbd2536a742ca5  --groups "all”'''


 