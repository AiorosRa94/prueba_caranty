import 'package:flutter/material.dart';

class ProviderCadena with ChangeNotifier{

  Map<String,int> freq = {};

  get frecuencias => freq;

  void getFrequency(String cadena) {
    for (var i=0; i<cadena.length;i++) {
      var character = cadena[i];
      if (freq.containsKey(character)) {
        freq[character] = freq[character]! + 1;
      } else {
        freq[character] = 1;
      }
    }
    notifyListeners();
  }
}