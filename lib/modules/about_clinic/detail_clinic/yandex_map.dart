import 'package:flutter/material.dart';
import 'package:medlike/modules/about_clinic/detail_clinic/yandex_geocoder.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapWidget extends StatelessWidget {
  YandexMapWidget({Key? key, required this.addressesList}) : super(key: key);

  final List<String> addressesList;

  late YandexMapController _mapController;

  final String style = '''
    [
      {
        "tags": {
          "all": ["landscape"]
        },
        "stylers": {
          // "color": "f00",
          "saturation": 0.5,
          "lightness": 0.5
        }
      }
    ]
  ''';

  String printLatLng(String address) {
    return YandexGeocoderClass().geocode(address).toString();
  }

  @override
  Widget build(BuildContext context) {
    addressesList.map((e) => printLatLng(e));

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: YandexMap(
            onMapCreated: (YandexMapController yandexMapController) async {
              _mapController = yandexMapController;
              _mapController.setMapStyle(style);
            },
          ),
        ),
        // ...addressesList.map((e) => FutureBuilder(
        //   future: YandexGeocoderClass().geocode(e),
        //   builder: (context, snapshot) {
        //     if(snapshot.hasData) {
        //       return Text('Delivery done: ${snapshot.data.toString()}');
        //     } else if(snapshot.hasError) {
        //       return Text('Delivery error: ${snapshot.error.toString()}');
        //     } else {
        //       return const CircularProgressIndicator();
        //     }
        //   }
        // )).toList()
      ],
    );
  }
}
