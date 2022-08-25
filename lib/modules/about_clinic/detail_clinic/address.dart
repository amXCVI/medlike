import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/themes/colors.dart';
import 'package:map_launcher/map_launcher.dart';

class ClinicAddress extends StatelessWidget {
  const ClinicAddress(
      {Key? key,
      required this.address,
      required this.lat,
      required this.lng,
      required this.clinicName})
      : super(key: key);

  final String address;
  final double lat;
  final double lng;
  final String clinicName;

  @override
  Widget build(BuildContext context) {
    void openMapsSheet(context) async {
      try {
        final coords = Coords(lat, lng);
        final title = clinicName;
        final availableMaps = await MapLauncher.installedMaps;

        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      } catch (e) {
        print(e);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 8),
      child: GestureDetector(
        onTap: () {
          openMapsSheet(context);
        },
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/clinics/ic_adress_outline.svg'),
            const SizedBox(width: 18),
            Flexible(
              child: Text(
                address,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                softWrap: true,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.mainOther),
              ),
            )
          ],
        ),
      ),
    );
  }
}
