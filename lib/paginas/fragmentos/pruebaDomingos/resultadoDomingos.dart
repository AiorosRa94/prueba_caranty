import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/providers/providerDomingo/providerDomingos.dart';
import 'package:prueba_caranty/recursos/colores/colores.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';
import 'package:prueba_caranty/widgets/texto/textoAutoajustable.dart';

class ResultadoDomingos extends StatelessWidget {
  const ResultadoDomingos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var providerDomingos = Provider.of<ProviderDomingos>(context);


    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.date_range, color: colores.principal,size: Pantalla(context).altoDisp(0.5),),
          const TextoAutoajustable(texto: "En tu rango de fechas solo ", tamanoTexto: 20,),
          TextoAutoajustable(texto: "${providerDomingos.cantidadDomingos}", tamanoTexto: 20, colorTexto: colores.principal,),
          const TextoAutoajustable(texto: "meses fueron domingo.", tamanoTexto: 20,),

        ],
      ),
    );
  }
}
