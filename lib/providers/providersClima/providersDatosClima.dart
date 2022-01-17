import 'package:flutter/material.dart';

class ProviderDatosClima with ChangeNotifier{

  double? _latitud;

  double? _longitud;

 double get latitud => _latitud ?? 0;

 double get longitud => _longitud ?? 0;

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