
import 'package:dio/dio.dart' as dio;
import 'package:weather_app/models/weather_data_model.dart';
class WeatherService{
   dio.Dio myDio = dio.Dio();
   static const String baseUrl = 'https://api.weatherapi.com/v1';
   static const String apiKey = '1c5356011e564f7dada222934252110';


  Future<WeatherModel> getWeatherData ({required String cityName}) async {
   try{
     var response = await myDio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
     WeatherModel weatherModel = WeatherModel.fromJson(response.data);
     return weatherModel;
   }
   catch(e){
     throw Exception(e);
   }
  } 

}