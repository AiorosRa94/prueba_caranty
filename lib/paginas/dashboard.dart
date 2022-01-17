import 'package:flip_box_bar_plus/flip_box_bar_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/providers/providerNavBar/providerNavBar.dart';
import 'package:prueba_caranty/recursos/colores/colores.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var providerNavBar = Provider.of<ProviderNavBar>(context);

    return Scaffold(
      appBar:  AppBar(title: const Text("Pruebas Caranty", style: TextStyle(color: Colors.white),), backgroundColor: colores.secundario, leading: Icon(Icons.directions_car_rounded, color: colores.principal,),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: Pantalla(context).altoDisp(2.5),
                  width: Pantalla(context).anchoDisp(9),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                          top: 0,
                          child: Text("Prueba",style: TextStyle(color: Colors.grey, fontSize: Pantalla(context).tamagnoTexto(12)))
                      ),
                      Positioned(
                        top: Pantalla(context).altoDisp(0.2),
                        child: SizedBox(
                          height: Pantalla(context).altoDisp(2.3),
                          width: Pantalla(context).anchoDisp(9),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: Colors.white,
                            shadowColor: Colors.grey,
                            child: providerNavBar.datos,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: Pantalla(context).altoDisp(4.5),
                  width: Pantalla(context).anchoDisp(9),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                          top: 0,
                          child: Text("Resultados",style: TextStyle(color: Colors.grey, fontSize: Pantalla(context).tamagnoTexto(12)))
                      ),
                      Positioned(
                        top: Pantalla(context).altoDisp(0.2),
                        child: SizedBox(
                          height: Pantalla(context).altoDisp(4.3),
                          width: Pantalla(context).anchoDisp(9),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: Colors.white,
                            shadowColor: Colors.grey,
                            child: providerNavBar.resultados,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),


      bottomNavigationBar: SizedBox(
        height: Pantalla(context).altoDisp(1),
        child: FlipBoxBarPlus(
          selectedIndex: providerNavBar.menu,
          navBarHeight: Pantalla(context).altoDisp(1),
          items: [
            FlipBarItem(
                icon: const Icon(Icons.cloud, color: Colors.white,),
                text: Text("Clima",style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10))),
                frontColor: colores.secundario,
                backColor: colores.principal
            ),
            FlipBarItem(
                icon: const Icon(Icons.date_range, color: Colors.white,),
                text: Text("Domingos",style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10))),
                frontColor: colores.secundario,
                backColor: colores.principal
            ),
            FlipBarItem(
                icon: const Icon(Icons.timelapse, color: Colors.white,),
                text: Text("Bisiestos",style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10))),
                frontColor: colores.secundario,
                backColor: colores.principal
            ),
            FlipBarItem(
                icon: const Icon(Icons.app_registration, color: Colors.white,),
                text: Text("Matriz",style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10))),
                frontColor: colores.secundario,
                backColor: colores.principal
            ),
            FlipBarItem(
                icon: const Icon(Icons.text_fields, color: Colors.white,),
                text: Text("Cadena",style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10))),
                frontColor: colores.secundario,
                backColor: colores.principal
            ),
            FlipBarItem(
                icon: const Icon(Icons.star, color: Colors.white,),
                text: Text("Matriz",style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10))),
                frontColor: colores.secundario,
                backColor: colores.principal
            ),
          ],
          onIndexChanged: (newIndex) {
            providerNavBar.menu = newIndex;
          },
        ),
      ),

    );
  }
}
