import 'package:auto_route/auto_route.dart';

class PushNavigationService {
  PageRouteInfo<dynamic>? _nextPage;

  PageRouteInfo<dynamic>? get nextPage {
    final page = _nextPage?.copyWith();
    /// Удаляем роут при каждом запросе на чтение
    _nextPage = null;
    return page;
  }

  set nextPage(PageRouteInfo<dynamic>? page) {
    _nextPage = page;
  }
}
