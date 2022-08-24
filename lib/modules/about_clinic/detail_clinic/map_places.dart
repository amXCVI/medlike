import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';
import 'package:medlike/data/models/clinic_models/clinic_models.dart';

class ClinicMapPlaces extends StatefulWidget {
  const ClinicMapPlaces({
    Key? key,
    required this.buildingsList,
    required this.handleSelectedBuilding,
    required this.selectedBuildingId,
  }) : super(key: key);

  final List<BuildingLatLngModel> buildingsList;
  final void Function(String) handleSelectedBuilding;
  final String selectedBuildingId;

  @override
  State<ClinicMapPlaces> createState() => _ClinicMapPlacesState();
}

class _ClinicMapPlacesState extends State<ClinicMapPlaces> {
  late MapController controller = MapController(
    location: const LatLng(47.23617, 38.89688),
  );

  @override
  void initState() {
    controller = MapController(
      location: widget.buildingsList.isNotEmpty
          ? LatLng(widget.buildingsList.first.latitude,
              widget.buildingsList.first.longitude)
          : const LatLng(47.23617, 38.89688),
      zoom: widget.buildingsList.length > 1 ? 17 : 18,
    );
    super.initState();
  }

  double clamp(double x, double min, double max) {
    if (x < min) x = min;
    if (x > max) x = max;

    return x;
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 0.5;
    final zoom = clamp(controller.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;

  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(
      BuildingLatLngModel itemBuilding, MapTransformer transformer) {
    Offset pos = transformer
        .toOffset(LatLng(itemBuilding.latitude, itemBuilding.longitude));
    bool isSelectedBuilding =
        itemBuilding.buildingId == widget.selectedBuildingId;
    return Positioned(
      left: isSelectedBuilding ? pos.dx - 16 : pos.dx - 22,
      top: isSelectedBuilding ? pos.dy - 12 : pos.dy - 16,
      child: GestureDetector(
        child: SvgPicture.asset(
          isSelectedBuilding
              ? 'assets/icons/clinics/ic_pin_large.svg'
              : 'assets/icons/clinics/ic_pin_small.svg',
          width: isSelectedBuilding ? 32 : 25,
        ),
        onTap: () {
          widget.handleSelectedBuilding(itemBuilding.buildingId);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MapLayout(
      controller: controller,
      builder: (context, transformer) {
        final markerWidgets = widget.buildingsList.map(
          (itemBuilding) => _buildMarkerWidget(itemBuilding, transformer),
        );

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTapDown: (details) => _onDoubleTap(
            transformer,
            details.localPosition,
          ),
          onScaleStart: _onScaleStart,
          onScaleUpdate: (details) => _onScaleUpdate(details, transformer),
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerSignal: (event) {
              if (event is PointerScrollEvent) {
                final delta = event.scrollDelta.dy / -1000.0;
                final zoom = clamp(controller.zoom + delta, 2, 18);

                transformer.setZoomInPlace(zoom, event.localPosition);
                setState(() {});
              }
            },
            child: Stack(
              children: [
                TileLayer(
                  builder: (context, x, y, z) {
                    final tilesInZoom = pow(2.0, z).floor();

                    while (x < 0) {
                      x += tilesInZoom;
                    }
                    while (y < 0) {
                      y += tilesInZoom;
                    }

                    x %= tilesInZoom;
                    y %= tilesInZoom;

                    final url =
                        'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                    return CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                    );
                  },
                ),
                ...markerWidgets,
              ],
            ),
          ),
        );
      },
    );
  }
}
