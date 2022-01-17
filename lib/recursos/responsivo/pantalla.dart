import 'package:flutter/material.dart';

class Pantalla {
  BuildContext context;
  late double _alto;
  late double _ancho;
  late double _tamagnoTexto;


  Pantalla(this.context) {
    MediaQueryData _queryData = MediaQuery.of(context);
    _tamagnoTexto = MediaQuery.textScaleFactorOf(context);
    _ancho = _queryData.size.width / 10;
    _alto = _queryData.size.height < 700 ? _queryData.size.height / 8.5 : _queryData.size.height / 10 ;

  }

  double altoDisp(double v) {
    return _alto * v;
  }

  double tamagnoTexto(double v) {
    return _tamagnoTexto * v;
  }

  double anchoDisp(double v) {
    return _ancho * v;
  }


}