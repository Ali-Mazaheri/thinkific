import 'dart:async';
import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:thinkific/models/user_location.dart';
import 'package:thinkific/models/weather_info.dart';
import 'package:thinkific/platforms/constants/app_constants.dart';
import 'package:thinkific/platforms/utils/conectivity.dart';
import 'package:thinkific/platforms/utils/geolocator.dart';
import 'package:thinkific/platforms/utils/http_helper.dart';
import 'package:thinkific/state_management/app_store.dart';

AppStore _store = AppStore();

class AppBloc {
  final StreamController<List<WeatherInfo>> _sc = StreamController<List<WeatherInfo>>();

  static AppBloc _instance;

  Stream<List<WeatherInfo>> get stream => _sc.stream;

  factory AppBloc() {
    _instance ??= AppBloc._internal();
    return _instance;
  }

  AppBloc._internal() {
    Timer.periodic(const Duration(minutes: 5), (timer) {
      reload();
    });
    reload();
  }

  Future<bool> reload() async {
    final connected = await isConnected();

    if (!connected) {
      final loc = WeatherInfo(null, AppConstants.NO_CONNECTION);
      sinkData([loc]);
      return true;
    }

    Position currentPosition;
    try {
      currentPosition = await getDevicePosition();
    } catch (e) {
      currentPosition = null;
    }

    final locations = await _store.getLocations();
    final endpoints = locations.map((location) {
      if (location.location == AppConstants.CURRENT_LOCATION) {
        if (currentPosition != null) {
          return getData(
            AppConstants.BASE_URL_LOCATION
                .replaceFirst('{lat}', currentPosition.latitude.toString())
                .replaceFirst('{lon}', currentPosition.longitude.toString()),
          );
        } else {
          final loc = WeatherInfo(null, AppConstants.GPS_SERVICE_UNAVALABLE);
          return Future.value(loc);
        }
      }
      return getData(AppConstants.BASE_URL_CITY.replaceFirst('{CITY}', location.location));
    });

    Future.wait(endpoints).then((data) {
      int index = 0;
      data.forEach((element) {
        element.location = locations[index];
        index++;
      });
      sinkData(data);
    });
    return true;
  }

  void sinkData(List<WeatherInfo> data) {
    _sc.sink.add(data);
  }

  Future<WeatherInfo> getData(String url) async {
    final json = await HttpHelper.getData(url);
    return WeatherInfo.fromJson(json);
  }

  void addneWLocation(String location) {
    final id = Random().nextDouble().toString() + Random().nextDouble().toString();
    final locationModel = UserLocation(id, location);
    _store.addLocation(locationModel);
    reload();
  }

  Future removeLocation(String id) async {
    await _store.removeLocation(id);
    reload();
  }

  Future updateLocation(UserLocation location) async {
    await _store.updateLocation(location);
    reload();
  }

  void dispose() {
    _sc.close();
  }
}
