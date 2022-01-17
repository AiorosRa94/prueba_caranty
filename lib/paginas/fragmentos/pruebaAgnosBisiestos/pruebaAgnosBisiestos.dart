import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/permisos/permisos.dart';
import 'package:prueba_caranty/providers/providerAgnosBisiestos/providerAgnosBisiestos.dart';
import 'package:prueba_caranty/providers/providersClima/providersDatosClima.dart';
import 'package:prueba_caranty/recursos/colores/colores.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';

class PruebaAgnosBisiestos extends StatelessWidget {
  PruebaAgnosBisiestos({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controladorAgnoInicio = TextEditingController();
  final TextEditingController _controladorAgnoFinal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var providerAgnoBisiesto = Provider.of<ProviderAgnosBisiestos>(context);

    return Center(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: Pantalla(context).altoDisp(0.7),
                  width: Pantalla(context).anchoDisp(7),
                  child: TextFormField(
                    controller: _controladorAgnoInicio,
                    keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 4,
                    decoration:   const InputDecoration(
                      hintText: 'Año inicial',
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

                      if(v.isEmpty) {
                        return 'Por favor introduzca un valor';
                      }

                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: Pantalla(context).altoDisp(0.7),
                  width: Pantalla(context).anchoDisp(7),
                  child: TextFormField(
                    controller: _controladorAgnoFinal,
                    keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 4,
                    decoration:   const InputDecoration(
                      hintText: 'Año final',
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

                      if(v.isEmpty) {
                        return 'Por favor introduzca un valor';
                      }

                    },
                  ),
                ),
              ),
              SizedBox(
                height: Pantalla(context).altoDisp(0.5),
                width: Pantalla(context).anchoDisp(4),
                child: ElevatedButton(onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    int agnoInicio = int.parse(_controladorAgnoInicio.text);
                    int agnoFinal = int.parse(_controladorAgnoFinal.text);

                    if(agnoInicio < 0 || agnoInicio > 9999 || agnoFinal < 0 || agnoFinal > 9999){
                      await FlutterPlatformAlert.showAlert(
                        windowTitle: '¡Ups!',
                        text: 'Los años no deben ser mayores a 9999 o menores a 0',
                        alertStyle: AlertButtonStyle.ok,
                        iconStyle: IconStyle.information,
                      );
                    }

                    else if(agnoInicio>agnoFinal){
                      await FlutterPlatformAlert.showAlert(
                        windowTitle: '¡Ups!',
                        text: 'El año de inicio no puede ser menor al año final',
                        alertStyle: AlertButtonStyle.ok,
                        iconStyle: IconStyle.information,
                      );
                    }

                    else{
                      providerAgnoBisiesto.nuevasFechas(_controladorAgnoInicio.text, _controladorAgnoFinal.text);
                    }

                  }
                },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(colores.principal),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18))

                        )
                    ),
                  ), child: Text("Calcular años bisiestos", style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10)),),),
              )
            ],
          )),
    );
  }
}
