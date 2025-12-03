part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class WeatherLoadedEvent extends WeatherEvent{
    final String cityName;

  WeatherLoadedEvent(this.cityName);

}