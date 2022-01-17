import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/providers/providerCadena/providerCadena.dart';
import 'package:prueba_caranty/recursos/colores/colores.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';

class PruebaContadorCadena extends StatelessWidget {
  PruebaContadorCadena({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controladorCadena = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var providerCadena = Provider.of<ProviderCadena>(context);

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
                    controller: _controladorCadena,
                    maxLength: 5000,
                    keyboardType: TextInputType.text,
                    decoration:   const InputDecoration(
                      hintText: 'Lorem Ipsum',
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
                    Row(
                      children: [
                        ElevatedButton(onPressed: ()  {
                          _controladorCadena.clear();
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
                            String cadena = _controladorCadena.text.replaceAll(RegExp("[\$&+,:;=?@#|'<>.^*()%!-]/^\\s*\$/"), "");
                            cadena = cadena.replaceAll(" ", "");
                            cadena = cadena.toLowerCase();

                            providerCadena.freq.clear();
                              providerCadena.getFrequency(cadena);
                          }
                        },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(colores.principal),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(18),topRight: Radius.circular(18))

                                )
                            ),
                          ), child: Text("Ver lista de caracteres", style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10)),),),
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
