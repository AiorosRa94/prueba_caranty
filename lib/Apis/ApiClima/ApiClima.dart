import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_caranty/estructurasJSON/dataClima/dataClima.dart';

class ApiClima with ChangeNotifier{

//API key: 6f5ff9bc38d3eaa73f7f95a99fdb59dd
//https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&units=metric&exclude=minutely,daily,alerts&lang=es&appid=6f5ff9bc38d3eaa73f7f95a99fdb59dd

  Future<DataClima> getDatosClima(double lat, double long) async {

    final response = await http
        .get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&units=metric&exclude=minutely,daily,alerts&lang=es&appid=6f5ff9bc38d3eaa73f7f95a99fdb59dd'));

    if (response.statusCode == 200) {
      return DataClima.fromJson(jsonDecode(response.body));
    } else {
      print("ERROR: ${response.body}");
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }

  }

}










