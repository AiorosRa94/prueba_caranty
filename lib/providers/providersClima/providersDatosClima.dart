import 'package:flutter/material.dart';

class ProviderDatosClima with ChangeNotifier{

  double? _latitud;

  double? _longitud;

 double get latitud => _latitud ?? 100;

 double get longitud => _longitud ?? 200;

 nuevaUbicacion(double nuevaLatitud,double nuevaLongitud){
   _latitud = nuevaLatitud;
   _longitud = nuevaLongitud;

   notifyListeners();
 }


  bool _nuevaConsulta = false;

  bool get nuevaConsulta => _nuevaConsulta;

  set nuevaConsulta(bool v){
    _nuevaConsulta = v;
    notifyListeners();
  }

}