library smooth_compass_gps;

import 'dart:async';
import 'dart:io';
import 'dart:math';

// import 'package:flutter_sensors/flutter_sensors.dart';

import 'package:flutter_sensors/flutter_sensors.dart';
import 'package:location/location.dart';
import 'package:sensors_plus/sensors_plus.dart' as senPls;
import 'package:smooth_compass_gps/src/qibla_utils_gps.dart';
import 'package:vector_math/vector_math.dart';
import 'package:logger/logger.dart';
import 'src/compass_ui.dart';



part 'src/compass_gps.dart';

class Compass {
  /// Singleton instance.
  static final Compass _instance = Compass._internal();

  /// Class factory. Init the instance if was not initialized before.
  factory Compass() {
    return _instance;
  }

  /// Internal private constructor for the singleton.
  Compass._internal();

  /// Plugin instance.
  final _CompassGPS _compass = _CompassGPS();

  ///Returns a stream to receive the compass updates.
  ///
  ///Remember to close the stream after using it.
  Stream<CompassModel> compassUpdates(
      {Duration? interval, double? azimuthFix, MyLoc? currentLoc}) =>
      _compass.compassUpdates(interval!, azimuthFix!, myLoc: currentLoc);

  /// Checks if the sensors needed for the compass to work are available.
  ///
  /// Returns true if the sensors are available or false otherwise.
  Future<bool> isCompassAvailable() => _CompassGPS.isCompassAvailable;

  void setAzimuthFix(double fix) => _compass.azimuthFix = fix;
}