import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tempo_template/screens/location_screen.dart';
import 'package:tempo_template/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

LocationClass location = LocationClass();

class _LoadingScreenState extends State<LoadingScreen> {

  LocationScreen location = LocationScreen();

  void pushToLocationScreen(dynamic weatherData) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(localWeatherData: weatherData);
    }));
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child: const Text('Obter Localização'),
        ),
      ),
    );
  }

  void deactivate() {
    // é disparado quando o widget foi destruído
  }
}
