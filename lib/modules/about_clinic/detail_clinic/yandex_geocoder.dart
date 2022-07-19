import 'package:medlike/constants/app_constants.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

class YandexGeocoderClass {
  final YandexGeocoder geocoder =
      YandexGeocoder(apiKey: AppConstants.yandexApiKey);

  // final GeocodeResponse geocodeFromPoint = geocoder.getGeocode(GeocodeRequest(
  // geocode: PointGeocode(latitude: 55.771899, longitude: 37.597576),
  // lang: Lang.enEn,
  // ));

  Future<GeocodeResponse> geocode(String address) async {
    GeocodeResponse geocodeFromAddress =
        await geocoder.getGeocode(GeocodeRequest(
      geocode: AddressGeocode(address: address),
      lang: Lang.enRu,
    ));
    return geocodeFromAddress;
  }
}
