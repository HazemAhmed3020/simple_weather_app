import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/screens/search_view.dart';
import 'package:weather_app/screens/weather_info_body.dart';
import 'no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchView()),
              );
            },
            icon: Icon(Icons.search, size: 30),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc , WeatherState>(
          builder: (context , state){
           if(state is WeatherInitial){
             return NoWeatherBody();
           }
           else if(state is WeatherUpdate){
             return WeatherInfoBody(weatherModel: state.weatherModel,);
           }
           else{
             return Center(child: const Text('ooops there was an error , try later'));
           }
          }

      )
    );
  }
}
