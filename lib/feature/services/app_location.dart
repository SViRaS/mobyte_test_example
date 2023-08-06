import 'package:mobyte_first_example/feature/services/app_lat_long.dart';

abstract class AppLocation {
  Future<AppLatLong> getCurrentLocation();


  Future<bool> requestPermission();


  Future<bool> checkPermission();
}

