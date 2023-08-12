import 'package:flutter/material.dart';
import 'package:open_weather_provider/providers/weather/weather_provider.dart';
import 'package:provider/provider.dart';

Widget showWeather(BuildContext context) {
  final state = context.watch<WeatherProvider>().state;

  if (state.status == WeatherStatus.initial) {
    return const Center(
      child: Text(
        'Select a city',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  if (state.status == WeatherStatus.loading) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  if (state.status == WeatherStatus.error && state.weather.name == '') {
    return const Center(
      child: Text(
        'Select a city',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  return Center(
    child: Text(
      state.weather.name,
      style: const TextStyle(fontSize: 18.0),
    ),
  );
}
