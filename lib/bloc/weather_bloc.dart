import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_data_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherLoadedEvent>((event, emit) async {
      try
      {
        final weatherModel = await WeatherService().getWeatherData(cityName: event.cityName);
        emit(WeatherUpdate(weatherModel));
      }
      catch(e)
      {
        emit(WeatherError());
      }
    });
  }
}
