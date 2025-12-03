part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherUpdate extends WeatherState {
 final WeatherModel weatherModel;

  WeatherUpdate(this.weatherModel);

}


final class WeatherError extends WeatherState {}
