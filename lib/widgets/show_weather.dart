import 'package:flutter/material.dart';
import 'package:open_weather_provider/providers/weather/weather_provider.dart';
import 'package:open_weather_provider/widgets/format_text.dart';
import 'package:open_weather_provider/widgets/show_icon.dart';
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

  return ListView(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 6,
      ),
      Text(
        state.weather.name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            TimeOfDay.fromDateTime(state.weather.lastUpdated).format(context),
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(width: 10.0),
          Text(
            '(${state.weather.country})',
            style: const TextStyle(fontSize: 18.0),
          ),
        ],
      ),
      const SizedBox(height: 60.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${state.weather.temp.toStringAsFixed(2)}℃',
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 20.0),
          Column(
            children: [
              Text(
                '${state.weather.tempMax.toStringAsFixed(2)}℃',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                '${state.weather.tempMin.toStringAsFixed(2)}℃',
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          )
        ],
      ),
      const SizedBox(height: 40.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          showIcon(state.weather.icon),
          Expanded(
            flex: 3,
            child: formatText(state.weather.description),
          ),
          const Spacer()
        ],
      )
    ],
  );
}
