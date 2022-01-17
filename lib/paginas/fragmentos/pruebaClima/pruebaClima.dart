import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/permisos/permisos.dart';
import 'package:prueba_caranty/providers/providersClima/providersDatosClima.dart';
import 'package:prueba_caranty/recursos/colores/colores.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';

class PruebaClima extends StatelessWidget {
   PruebaClima({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controladorLatitud = TextEditingController();
  final TextEditingController _controladorLongitud = TextEditingController();

  final _permisos = Permisos();

  @override
  Widget build(BuildContext context) {
    var providerClima = Provider.of<ProviderDatosClima>(context);

    return Center(
      child: Form(
        key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: Pantalla(context).altoDisp(0.6),
                  width: Pantalla(context).anchoDisp(7),
                  child: TextFormField(
                    controller: _controladorLatitud,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true,signed: true),
                    decoration:   const InputDecoration(
                      hintText: 'Latitud',
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide:  BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    validator: (String? valor) {
                      String v = valor ?? "";
                      RegExp lat = RegExp(r'^(\+|-)?(?:(?:(?:\.0{1,6})?)|(?:[0-9]|[1-8][0-9])(?:(?:\.[0-9]{1,8})?))$');

                      if(v.isEmpty) {
                        return 'Por favor introduzca un valor';
                      }

                      if(!lat.hasMatch(v)){
                        return 'Latitud no valida';
                      }

                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: Pantalla(context).altoDisp(0.6),
                  width: Pantalla(context).anchoDisp(7),
                  child: TextFormField(
                    controller: _controladorLongitud,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true,signed: true),
                    decoration:   const InputDecoration(
                      hintText: 'Longitud',
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide:  BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    onChanged: (valor){
                      _formKey.currentState!.validate();
                    },
                    validator: (valor ) {
                      String v = valor ?? "";
                      RegExp long = RegExp(r'^(\+|-)?(?:(?:(?:\.0{1,6})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:\.[0-9]{1,8})?))$');

                      if(v.isEmpty) {
                        return 'Por favor introduzca un valor';
                      }

                      if(!long.hasMatch(v)){
                        return 'Longitud no valida';
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: Pantalla(context).altoDisp(0.5),
                width: Pantalla(context).anchoDisp(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: () async {
                      bool permisos = await _permisos.getPermisoGPS();
                     if(permisos == true){
                       Location gps =  Location();

                       bool servicioDisponible = await gps.serviceEnabled();
                       if(servicioDisponible){
                         LocationData datosGps = await gps.getLocation();

                         _controladorLatitud.text = datosGps.latitude.toString();
                         _controladorLongitud.text = datosGps.longitude.toString();

                       }
                       else{
                         await FlutterPlatformAlert.showAlert(
                           windowTitle: '¡Ups!',
                           text: 'Debes encender el gps para usar esta función',
                           alertStyle: AlertButtonStyle.ok,
                           iconStyle: IconStyle.information,
                         );
                       }

                     }
                    }, icon: Icon(Icons.location_pin, color: colores.principal,)),

                    Row(
                      children: [
                        ElevatedButton(onPressed: ()  {
                          _controladorLatitud.clear();
                          _controladorLongitud.clear();
                        },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(colores.secundario),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18),topLeft: Radius.circular(18))
                                )
                            ),
                          ), child: Text("Limpiar", style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10)),),),
                        ElevatedButton(onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            double latitud = double.parse(_controladorLatitud.text);
                            double longitud = double.parse(_controladorLongitud.text);

                            if(latitud < -90 || latitud > 90){
                              await FlutterPlatformAlert.showAlert(
                                windowTitle: '¡Ups!',
                                text: 'La latitud tiene que ser entre -90 y 90',
                                alertStyle: AlertButtonStyle.ok,
                                iconStyle: IconStyle.information,
                              );
                            }

                            else if(longitud < -180 || longitud > 180){
                              await FlutterPlatformAlert.showAlert(
                                windowTitle: '¡Ups!',
                                text: 'La longitud tiene que ser entre -180 y 180',
                                alertStyle: AlertButtonStyle.ok,
                                iconStyle: IconStyle.information,
                              );
                            }

                            else{
                              providerClima.nuevaUbicacion(latitud, longitud);
                            }

                          }
                        },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(colores.principal),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(18),topRight: Radius.circular(18))

                                )
                            ),
                          ), child: Text("Ver el clima", style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10)),),),
                      ],
                    )

                  ],
                ),
              )
            ],
          )),
    );
  }
}
