import 'package:yandex_geocoder/yandex_geocoder.dart';

final YandexGeocoder geocoder =
    YandexGeocoder(apiKey: '70f032e6-5f1b-47ab-9490-3f50c5df46aa',);
String city = "Manzilni tanlang";

Future<void> address(double latitude, double longitude) async {
  final GeocodeResponse geocodeFromPoint =
      await geocoder.getGeocode(GeocodeRequest(
    geocode: PointGeocode(latitude: latitude, longitude: longitude),
    lang: Lang.enEn,
  ));
  city = geocodeFromPoint.firstAddress!.formatted.toString();
  for (int i = 0; i < city.length; i++) {
    if (city[i].contains(',')) {
      city = city.substring(i + 2, city.length);
      break;
    }
  }
}
