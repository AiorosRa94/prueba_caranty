import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/providers/providerAgnosBisiestos/providerAgnosBisiestos.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';

class ResultadosAgnosBisiestos extends StatelessWidget {
  const ResultadosAgnosBisiestos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   var providerAgnoBisiesto = Provider.of<ProviderAgnosBisiestos>(context);

    return Center(
      child: ListView.builder(
          itemCount: providerAgnoBisiesto.agnosBisiestos.length,
          itemBuilder: (BuildContext context,int index){
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Text(providerAgnoBisiesto.agnosBisiestos[index], style: TextStyle(fontSize: Pantalla(context).tamagnoTexto(20)),textAlign: TextAlign.center,),
            );
          }
      ),
    );
  }
}
