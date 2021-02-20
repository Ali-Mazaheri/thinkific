import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:thinkific/models/user_location.dart';
import 'package:thinkific/platforms/constants/app_constants.dart';

class AppStore {
  List<UserLocation> _data;

  Future<List<UserLocation>> getLocations() async {
    if (_data == null) {
      final prefs = await SharedPreferences.getInstance();
      final storedString = prefs.getString(AppConstants.STORAGE_KEY);
      if (storedString?.isEmpty ?? true) {
        _data = [UserLocation('Default', AppConstants.CURRENT_LOCATION)];
        return _data;
      }
      final List jsonArray = jsonDecode(storedString) as List;
      _data = jsonArray.map((dynamic e) => UserLocation.fromJson(e as Map<String, dynamic>)).toList();
    }
    return _data;
  }

  Future<bool> _setData(List<UserLocation> value) async {
    final serialized = jsonEncode(_data);
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(AppConstants.STORAGE_KEY, serialized);
  }

  Future addLocation(UserLocation value) async {
    _data.add(value);
    await _setData(_data);
  }

  Future<bool> removeLocation(String id) async {
    _data.removeWhere((element) => element.id == id);
    return await _setData(_data);
  }

  Future<bool> updateLocation(UserLocation location) async {
    final item = _data.firstWhere((element) => element.id == location.id, orElse: null);
    if (item != null) {
      item.location = location.location;
    }
    return await _setData(_data);
  }
}
