import 'package:flutter/material.dart';
import 'package:thinkific/models/user_location.dart';
import 'package:thinkific/models/weather_info.dart';
import 'package:thinkific/platforms/constants/app_constants.dart';
import 'package:thinkific/platforms/widgets/app_text_box.widget.dart';

class WeatherCard extends StatelessWidget {
  final WeatherInfo weatherInfo;
  final Function(String id) onDelete;
  final Function(UserLocation id) onEdit;

  const WeatherCard({
    @required this.weatherInfo,
    @required this.onDelete,
    @required this.onEdit,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loaded = weatherInfo?.name?.isNotEmpty ?? weatherInfo?.location?.location?.isNotEmpty ?? false;

    final noInternet = weatherInfo?.name == AppConstants.NO_CONNECTION;
    final noGPS = weatherInfo?.name == AppConstants.GPS_SERVICE_UNAVALABLE;

    final String errorMessage = noInternet
        ? AppConstants.NO_CONNECTION
        : noGPS
            ? AppConstants.GPS_SERVICE_UNAVALABLE
            : null;
    final noService = noInternet || noGPS;

    return Card(
      color: const Color.fromRGBO(100, 100, 100, 190),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextBox(
                  weatherInfo?.name ?? weatherInfo?.location?.location ?? '',
                  color: Colors.amber,
                ),
                if (onEdit != null)
                  IconButton(
                    color: Colors.grey,
                    icon: const Icon(
                      Icons.edit_outlined,
                    ),
                    onPressed: () {
                      if (loaded) {
                        onEdit(weatherInfo.location);
                      }
                    },
                  ),
              ],
            ),
            Center(
              child: AppTextBox(
                loaded
                    ? noService
                        ? errorMessage
                        : ((weatherInfo?.main?.temp ?? '').toString() + ' ' + String.fromCharCode(0176) + 'C')
                    : 'Loading ...',
                alignment: TextAlign.center,
                color: Colors.grey[300],
                fontSize: 32,
                isBold: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextBox(
                  loaded ? 'Last Update: ${DateTime.now().toString().substring(0, 19)}' : '',
                  color: Colors.white,
                  fontSize: 16,
                ),
                if (onDelete != null)
                  IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      if (loaded) {
                        onDelete(weatherInfo.location.id);
                      }
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
