import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ProviderAgnosBisiestos with ChangeNotifier{

  DateTime _agnoInicial =  DateFormat("yyyy").parse("2022");
  DateTime _agnoFinal =  DateFormat("yyyy").parse("2022");

  List<String> agnosBisiestos= [];

  void nuevasFechas(String fechaInicial, String fechaFinal){
    _agnoInicial =  DateFormat("yyyy").parse(fechaInicial);
    _agnoFinal =  DateFormat("yyyy").parse(fechaFinal);
    calcularBisiestos();
    notifyListeners();
  }

  void calcularBisiestos(){
    agnosBisiestos.clear();
    for(_agnoInicial;_agnoInicial.isBefore(_agnoFinal) || _agnoInicial.isAtSameMomentAs(_agnoFinal);_agnoInicial = DateTime(_agnoInicial.year + 1)){

      if(esBisiesto(_agnoInicial.year.toInt())){
        print("Se agregara el año ${_agnoInicial.year}");
        agnosBisiestos.add("@${_agnoInicial.year}");
      }

      else{
        print("No es bisiesto: ${_agnoInicial.year}");
      }

    }
    notifyListeners();
  }

  bool esBisiesto(int agno) {
    if (agno % 4 == 0 || agno % 400 == 0 && agno % 100 != 0) {
      return true;
    } else {
    return false;
    }
  }
}