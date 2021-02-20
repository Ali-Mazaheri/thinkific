class AppConstants {
  static const STORAGE_KEY = 'LOCATION_STORAGE';
  static const CURRENT_LOCATION = 'CURRENT_LOCATION';
  static const GPS_SERVICE_UNAVALABLE = 'GPS Problem';
  static const NO_CONNECTION = 'No Network';

  static const BASE_URL_CITY =
      'https://api.openweathermap.org/data/2.5/weather?q={CITY}&units=metric&appid=b946086d77196c00e1fa5c1dec38e581';
  static const BASE_URL_LOCATION =
      'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&units=metric&appid=b946086d77196c00e1fa5c1dec38e581';
}
