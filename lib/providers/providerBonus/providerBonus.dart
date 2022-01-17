import 'dart:math';

import 'package:flutter/material.dart';

class ProviderBonus with ChangeNotifier{
  double res = 0;
  double n = 0;
  double factorialMovimientos = 1;
  double factorialCruadicula = 1;

  bool _mostrarBotonAdv = false;

  bool get mostrarBotonAdv => _mostrarBotonAdv;

  set mostrarBotonAdv(bool v){
    _mostrarBotonAdv = v;
  }


  void calcularMovimients(double nuevoValor){
    n = nuevoValor;

    double x = n * 2;

    for( double i = x ; i >= 1; i-- ) {
      factorialMovimientos *= i ;
    }

    for( double i = n ; i >= 1; i-- ) {
      factorialCruadicula *= i ;
    }
    print("n: $factorialMovimientos");
    print("Entre: $factorialCruadicula^2");

    res = factorialMovimientos/pow(factorialCruadicula, 2);

    notifyListeners();
    print("Los movimientos son: $res");
  }

  void restaurarValores(){
    n = 0;
    factorialCruadicula = 1;
    factorialMovimientos = 1;
  }

}