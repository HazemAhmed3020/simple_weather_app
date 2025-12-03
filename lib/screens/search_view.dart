import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search' , textScaleFactor: 1.5,),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (value){
              BlocProvider.of<WeatherBloc>(context).add(WeatherLoadedEvent(value));
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Search',
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
