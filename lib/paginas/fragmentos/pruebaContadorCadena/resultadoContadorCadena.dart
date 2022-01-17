import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/providers/providerCadena/providerCadena.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';

class ResultadoContadorCadena extends StatelessWidget {
  const ResultadoContadorCadena({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var providerCadena = Provider.of<ProviderCadena>(context);
    var lista = providerCadena.freq.entries.toList();

    return Center(
      child: ListView.builder(
          itemCount: providerCadena.freq.length,
          itemBuilder: (BuildContext context,int index){
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Text("${lista[index].key}: ${lista[index].value}", style: TextStyle(fontSize: Pantalla(context).tamagnoTexto(20)),textAlign: TextAlign.center,),
            );
          }
      ),
    );
  }
}
