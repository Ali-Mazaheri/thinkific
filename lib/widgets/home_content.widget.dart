import 'package:flutter/material.dart';
import 'package:thinkific/main.dart';
import 'package:thinkific/models/user_location.dart';
import 'package:thinkific/models/weather_info.dart';
import 'package:thinkific/platforms/widgets/app_modal.widget.dart';
import 'package:thinkific/platforms/widgets/favorite_button.widget.dart';
import 'package:thinkific/platforms/widgets/refresh_button.widget.dart';
import 'package:thinkific/platforms/widgets/weather_card.widget.dart';
import 'package:thinkific/state_management/app_bloc.dart';
import 'package:thinkific/widgets/editor_content.widget.dart';

AppBloc bloc = AppBloc();

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key key,
  }) : super(key: key);

  Future showEditor(bool isNew, UserLocation userLocation) async {
    final selectedCity = await showAppModal<String>(
      EditorContent(
        onSelect: (cityName) {
          Navigator.of(appNavKey.currentContext).pop(cityName);
        },
      ),
    );

    if (selectedCity?.isNotEmpty ?? false) {
      if (isNew) {
        bloc.addneWLocation(selectedCity);
      } else {
        userLocation.location = selectedCity;
        bloc.updateLocation(userLocation);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WeatherInfo>>(
        stream: bloc.stream,
        initialData: const [],
        builder: (context, snapshot) {
          final weatherInfo = snapshot.data;
          final List<WeatherInfo> restInfo = weatherInfo.length > 1 ? weatherInfo.sublist(1) : [];

          final restData = restInfo.map(
            (e) => WeatherCard(
              weatherInfo: e,
              onDelete: bloc.removeLocation,
              onEdit: (UserLocation userLocation) {
                showEditor(false, userLocation);
              },
            ),
          );

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RefreshButton(
                onPress: () {
                  bloc.reload();
                },
              ),
              WeatherCard(
                weatherInfo: weatherInfo.isNotEmpty ? weatherInfo[0] : null,
                onDelete: null,
                onEdit: (UserLocation userLocation) {
                  showEditor(false, userLocation);
                },
              ),
              FavoriteButton(
                onPress: () {
                  showEditor(true, null);
                },
              ),
              ...restData
            ],
          );
        });
  }
}
