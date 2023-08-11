import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   _fetchWeather();
  // }

  // _fetchWeather() {
  //   WeatherRepository(
  //           weatherApiServices: WeatherApiServices(httpClient: http.Client()))
  //       .fetchWeather('kollam');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
