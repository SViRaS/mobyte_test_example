import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_first_example/services/app_lat_long.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../services/location_service.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

final mapControllerCompleter = Completer<YandexMapController>();

class _MapWidgetState extends State<MapWidget> {
  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 246.h,
      child: YandexMap(
        onMapCreated: (controller) {
          mapControllerCompleter.complete(controller);
        },
      ),
    );
  }
}

Future<void> _initPermission() async {
  if (!await LocationService().checkPermission()) {
    await LocationService().requestPermission();
  }
  await _fetchCurrentLocation();
}

Future<void> _fetchCurrentLocation() async {
  AppLatLong location;
  const defLocation = EkaterinburgLocaton();
  try {
    location = await LocationService().getCurrentLocation();
  } catch (_) {
    location = defLocation;
  }
  _moveToCurrentLocation(location);
}

Future<void> _moveToCurrentLocation(
  AppLatLong appLatLong,
) async {
  (await mapControllerCompleter.future).moveCamera(
    animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
    CameraUpdate.newCameraPosition(
      CameraPosition(
        target: Point(
          latitude: appLatLong.lat,
          longitude: appLatLong.long,
        ),
        zoom: 12,
      ),
    ),
  );
}
