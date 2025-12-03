import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/screens/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: Builder(
          builder: (context) {
            return BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                MaterialColor themeColor;
                if(state is WeatherUpdate){
                  themeColor = getThemeColor(state.weatherModel.weatherCondition);
                }
                else {
                  themeColor = Colors.cyan;
                }
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    useMaterial3: false,
                     // colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
                     primarySwatch: themeColor,
                  ),
                  home: HomeView(),
                );
              },
            );
          }
      ),
    );
  }

}

MaterialColor getThemeColor(String condition) {
  if (condition == 'Sunny') {
    return Colors.orange;
  }

  else if (condition == 'Partly cloudy' ||
      condition == 'Cloudy' ||
      condition == 'Overcast') {
    return Colors.blueGrey;
  }

  else if (condition == 'Patchy rain possible' ||
      condition == 'Patchy light drizzle' ||
      condition == 'Light drizzle' ||
      condition == 'Patchy light rain' ||
      condition == 'Light rain' ||
      condition == 'Moderate rain at times' ||
      condition == 'Moderate rain' ||
      condition == 'Heavy rain at times' ||
      condition == 'Heavy rain' ||
      condition == 'Light rain shower' ||
      condition == 'Moderate or heavy rain shower' ||
      condition == 'Torrential rain shower') {
    return Colors.blue;
  }
  else if (condition == 'Thundery outbreaks possible' ||
      condition == 'Patchy light rain with thunder' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Patchy light snow with thunder' ||
      condition == 'Moderate or heavy snow with thunder') {
    return Colors.deepPurple;
  }

  else if (condition == 'Patchy snow possible' ||
      condition == 'Blowing snow' ||
      condition == 'Blizzard' ||
      condition == 'Patchy light snow' ||
      condition == 'Light snow' ||
      condition == 'Patchy moderate snow' ||
      condition == 'Moderate snow' ||
      condition == 'Patchy heavy snow' ||
      condition == 'Heavy snow' ||
      condition == 'Light snow showers' ||
      condition == 'Moderate or heavy snow showers') {
    return Colors.lightBlue;
  }

  else if (condition == 'Patchy sleet possible' ||
      condition == 'Patchy freezing drizzle possible' ||
      condition == 'Freezing drizzle' ||
      condition == 'Heavy freezing drizzle' ||
      condition == 'Light freezing rain' ||
      condition == 'Moderate or heavy freezing rain' ||
      condition == 'Light sleet' ||
      condition == 'Moderate or heavy sleet' ||
      condition == 'Ice pellets' ||
      condition == 'Light sleet showers' ||
      condition == 'Moderate or heavy sleet showers' ||
      condition == 'Light showers of ice pellets' ||
      condition == 'Moderate or heavy showers of ice pellets') {
    return Colors.cyan;
  }

  else if (condition == 'Mist' ||
      condition == 'Fog' ||
      condition == 'Freezing fog') {
    return Colors.grey;
  }

  else {
    return Colors.blue;
  }
}

