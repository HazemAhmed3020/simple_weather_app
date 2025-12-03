
class WeatherModel{
  final String name;
  final String lastUpdate;
  final String image;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String weatherCondition;

  WeatherModel({required this.name, required this.lastUpdate, required this.image, required this.maxTemp, required this.minTemp, required this.avgTemp, required this.weatherCondition});

factory WeatherModel.fromJson(json){
  return WeatherModel(
      name: json['location']['name'],
      lastUpdate: json['current']['last_updated'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      avgTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
     image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
  );
}
}