import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_data_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    MaterialColor themeColor = getThemeColor(weatherModel.weatherCondition);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.topCenter, end: AlignmentGeometry.bottomCenter,
          colors: [themeColor, themeColor.shade300, themeColor.shade50],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Text(
            'updated at ${weatherModel.lastUpdate.substring(11, 16)}',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network('https:${weatherModel.image}'),
              Text(
                '${weatherModel.avgTemp.round()}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Column(
                children: [
                  Text(
                    'Maxtemp: ${weatherModel.maxTemp.round()}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Mintemp: ${weatherModel.minTemp.round()}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            weatherModel.weatherCondition,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ],
      ),
    );
  }
}
