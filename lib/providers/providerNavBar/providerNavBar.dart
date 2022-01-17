import 'package:flutter/material.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaAgnosBisiestos/pruebaAgnosBisiestos.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaAgnosBisiestos/resultadoAgnosBisiestos.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaBonus/pruebaBonus.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaBonus/resultadoBonus.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaClima/pruebaClima.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaClima/resultadoClima.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaContadorCadena/pruebaContadorCadena.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaContadorCadena/resultadoContadorCadena.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaDomingos/pruebaDomingos.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaDomingos/resultadoDomingos.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaMatriz/pruebaMatriz.dart';
import 'package:prueba_caranty/paginas/fragmentos/pruebaMatriz/resultadoMatriz.dart';


class ProviderNavBar with ChangeNotifier {

  int _menuSeleccionado = 0;

  final List<Widget> _datos = [PruebaClima(), PruebaDomingos(), PruebaAgnosBisiestos(),const PruebaMatriz(), PruebaContadorCadena(),  PruebaBonus()];
  final List<Widget> _resultados = const [ResultadoClima(), ResultadoDomingos(), ResultadosAgnosBisiestos(),ResultadoMatriz(), ResultadoContadorCadena(), ResultadoBonus()];

  int get menu => _menuSeleccionado;

  Widget get datos => _datos[_menuSeleccionado];
  Widget get resultados => _resultados[_menuSeleccionado];

  set menu(int nuevaSeleccion) {
    _menuSeleccionado = nuevaSeleccion;
    notifyListeners();
  }

}