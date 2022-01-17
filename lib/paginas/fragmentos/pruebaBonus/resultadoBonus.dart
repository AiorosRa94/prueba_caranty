import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/providers/providerBonus/providerBonus.dart';
import 'package:prueba_caranty/recursos/colores/colores.dart';
import 'package:prueba_caranty/widgets/texto/textoAutoajustable.dart';

class ResultadoBonus extends StatelessWidget {
  const ResultadoBonus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var providerBonus = Provider.of<ProviderBonus>(context);


    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextoAutoajustable(texto: "El numero de rutas posibles es: ", tamanoTexto: 20,),
          TextoAutoajustable(texto: "${providerBonus.res}", tamanoTexto: 20, colorTexto: colores.principal,),

        ],
      ),
    );
  }
}
