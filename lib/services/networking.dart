import 'dart:convert';
import 'dart:io';

import 'package:tempo_template/services/location.dart';

const apiKey = '1703b93a5b26d65802d7b1d543b417af';

LocationClass location = LocationClass();

class NetworkHelper {

  late double latitude;
  late double longitude;
  final String url;

  NetworkHelper(this.url);

  Future<void> getLocation() async {
    var location = LocationClass();
    await location.getCurrentLocation();

    latitude = location.latitude!;
    longitude = location.longitude!;

    getData();
  }

  Future getData() async {
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/'
        'data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    if (weatherData.statusCode == 200) { // se a requisição foi feita com sucesso
      var data = weatherData.body;
      return jsonDecode(data);
    } else {
      stderr.writeln(weatherData.statusCode);  // senão, imprima o código de erro
    }
  }
}