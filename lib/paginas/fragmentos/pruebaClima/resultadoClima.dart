import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/Apis/ApiClima/ApiClima.dart';
import 'package:prueba_caranty/estructurasJSON/dataClima/dataClima.dart';
import 'package:prueba_caranty/providers/providersClima/providersDatosClima.dart';
import 'package:prueba_caranty/recursos/colores/colores.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';
import 'package:prueba_caranty/widgets/contenedores/contenedorMiniClima.dart';
import 'package:prueba_caranty/widgets/texto/textoAutoajustable.dart';

class ResultadoClima extends StatelessWidget {
  const ResultadoClima({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var providerClima = Provider.of<ProviderDatosClima>(context);
    ApiClima _api = ApiClima();
    initializeDateFormatting('es_MX', null);

    return providerClima.latitud > 90 || providerClima.longitud > 180 ?  Center(child: Column(children: [],),):
     FutureBuilder<DataClima>(
        future: _api.getDatosClima(providerClima.latitud, providerClima.longitud),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting) {

            return Center(child: CircularProgressIndicator(color: colores.principal,),);
          } else if (snapshot.hasData) {
            final DateTime ahora = DateTime.now();
            final DateFormat formato = DateFormat('dd-MM-yyyy');
            final String ahoraformato = formato.format(ahora);

            return SizedBox(
              height: Pantalla(context).altoDisp(4),
              width: Pantalla(context).anchoDisp(9),
              child:  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextoAutoajustable(texto: ahoraformato,tamanoTexto: 10, colorTexto: colores.auxiliar.shade500,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                    child: TextoAutoajustable(texto: snapshot.data!.timezone.split("/")[1].replaceAll(RegExp('_'), ' '),tamanoTexto: 20, colorTexto: colores.secundario,),
                  ),
                  TextoAutoajustable(texto: snapshot.data!.hourly[0].weather[0].description, tamanoTexto: 20, colorTexto: colores.auxiliar.shade600,),

                  Icon(Icons.wb_cloudy_outlined, size: Pantalla(context).altoDisp(0.5),),
                  
                   TextoAutoajustable(texto: "${snapshot.data!.hourly[0].temp.toString()}°", tamanoTexto: 20,),
                  const Divider(),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContenedorMiniClima(textoFecha: DateFormat('EEE h:mm a', "es_MX").format(DateTime.fromMillisecondsSinceEpoch(snapshot.data!.hourly[1].dt * 1000)), textoTemp: snapshot.data!.hourly[1].temp.toString(),),
                        ContenedorMiniClima(textoFecha: DateFormat('EEE h:mm a', "es_MX").format(DateTime.fromMillisecondsSinceEpoch(snapshot.data!.hourly[2].dt * 1000)), textoTemp: snapshot.data!.hourly[2].temp.toString(),),
                        ContenedorMiniClima(textoFecha: DateFormat('EEE h:mm a', "es_MX").format(DateTime.fromMillisecondsSinceEpoch(snapshot.data!.hourly[3].dt * 1000)), textoTemp: snapshot.data!.hourly[3].temp.toString(),),
                        ContenedorMiniClima(textoFecha: DateFormat('EEE h:mm a', "es_MX").format(DateTime.fromMillisecondsSinceEpoch(snapshot.data!.hourly[4].dt * 1000)), textoTemp: snapshot.data!.hourly[4].temp.toString(),),
                        ContenedorMiniClima(textoFecha: DateFormat('EEE h:mm a', "es_MX").format(DateTime.fromMillisecondsSinceEpoch(snapshot.data!.hourly[5].dt * 1000)), textoTemp: snapshot.data!.hourly[5].temp.toString(),),
                        ContenedorMiniClima(textoFecha: DateFormat('EEE h:mm a', "es_MX").format(DateTime.fromMillisecondsSinceEpoch(snapshot.data!.hourly[6].dt * 1000)), textoTemp: snapshot.data!.hourly[6].temp.toString(),),
                      ],
                    ),
                  ),

                  const Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("Vel. viento", style: TextStyle(fontSize: 15, color:colores.auxiliar),textAlign: TextAlign.center,),
                          Text("${snapshot.data!.hourly[1].windSpeed} m/s", style: TextStyle(fontSize: 15, color:colores.auxiliar), textAlign: TextAlign.center,),
                        ],
                      ),
                      Divider(),
                      Column(
                        children: [
                          Text("Humedad", style: TextStyle(fontSize: 15, color:colores.auxiliar),textAlign: TextAlign.center,),
                          Text("${snapshot.data!.hourly[1].humidity} %", style: TextStyle(fontSize: 15, color:colores.auxiliar), textAlign: TextAlign.center,),
                        ],
                      ),

                    ],
                  ),
                ],
              )
            );
          } else if (snapshot.hasError) {
            return const  Center(child: TextoAutoajustable(texto: "¡Ups! Ocurrio un error", tamanoTexto: 30,),);
          }
          else{
            return const Center(child: TextoAutoajustable(texto: "¡Ups! Algo ha salido muy mal", tamanoTexto: 25,),);
          }
        }
    );
  }
}
