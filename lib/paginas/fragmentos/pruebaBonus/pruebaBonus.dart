import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/providers/providerBonus/providerBonus.dart';
import 'package:prueba_caranty/providers/providerCadena/providerCadena.dart';
import 'package:prueba_caranty/recursos/colores/colores.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';

class PruebaBonus extends StatelessWidget {
  PruebaBonus({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controladorNumero = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var providerBonus = Provider.of<ProviderBonus>(context);

    return Center(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: Pantalla(context).altoDisp(1),
                  width: Pantalla(context).anchoDisp(7),
                  child: TextFormField(
                    controller: _controladorNumero,
                    maxLength: 2,
                    keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration:   const InputDecoration(
                      hintText: 'Introduce el numero de casillas',
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
              SizedBox(
                height: Pantalla(context).altoDisp(0.5),
                width: Pantalla(context).anchoDisp(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        double valorCuadricula = double.parse(_controladorNumero.text);

                        if(valorCuadricula == 0){
                          await FlutterPlatformAlert.showAlert(
                            windowTitle: '¡Ups!',
                            text: 'El numero de casillas debe ser mayor a 0',
                            alertStyle: AlertButtonStyle.ok,
                            iconStyle: IconStyle.information,
                          );
                        }

                        else if(valorCuadricula > 85){
                          await FlutterPlatformAlert.showAlert(
                            windowTitle: '¡Lo siento!',
                            text: 'No puedo realizar una operacion mas grande',
                            alertStyle: AlertButtonStyle.ok,
                            iconStyle: IconStyle.information,
                          );
                        }


                        else{
                          if(valorCuadricula > 36 && providerBonus.mostrarBotonAdv == false){
                            await FlutterPlatformAlert.showAlert(
                              windowTitle: '¡Lo siento!',
                              text: 'Los numeros ya son demasiado grandes. Apartir del 36 se mostraran con exponencial',
                              alertStyle: AlertButtonStyle.ok,
                              iconStyle: IconStyle.information,
                            );
                            providerBonus.mostrarBotonAdv = true;
                            providerBonus.restaurarValores();
                            providerBonus.calcularMovimients(valorCuadricula);
                          }

                          else{
                            providerBonus.restaurarValores();
                            providerBonus.calcularMovimients(valorCuadricula);
                          }
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
                      ), child: Text("Calcular movimientos", style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10)),),)
                  ],
                ),
              )
            ],
          )),
    );
  }
}
