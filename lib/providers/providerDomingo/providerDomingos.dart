import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ProviderDomingos with ChangeNotifier{

   DateTime _fechaInicial =  DateFormat("dd-MM-yyyy").parse("01-01-2022");
   DateTime _fechaFinal =  DateFormat("dd-MM-yyyy").parse("01-01-2022");

  int cantidadDomingos = 0;

  void nuevasFechas(String fechaInicial, String fechaFinal){
     _fechaInicial =  DateFormat("dd-MM-yyyy").parse(fechaInicial);
     _fechaFinal =  DateFormat("dd-MM-yyyy").parse(fechaFinal);
     calcularDomingos();
     notifyListeners();
  }

  void calcularDomingos(){

    for(_fechaInicial;_fechaInicial.isBefore(_fechaFinal);
    (_fechaInicial.month < 12) ? _fechaInicial = DateTime(_fechaInicial.year, _fechaInicial.month + 1, 1) : _fechaInicial = DateTime(_fechaInicial.year + 1, 1, 1)
    ){
      print("Compara: $_fechaInicial");

      var inicioDeMes = (_fechaInicial.month < 12) ?  DateTime(_fechaInicial.year, _fechaInicial.month + 1, 1) :  DateTime(_fechaInicial.year + 1, 1, 1);

      if(inicioDeMes.subtract(const Duration(days: 1)).weekday == 7) {
        cantidadDomingos++;
      }

    }
    notifyListeners();
  }

}