import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/providers/providerDomingo/providerDomingos.dart';
import 'package:prueba_caranty/providers/providersClima/providersDatosClima.dart';
import 'package:prueba_caranty/recursos/colores/colores.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';

class PruebaDomingos extends StatelessWidget {
  PruebaDomingos({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controladorFechaInicial= TextEditingController();
  final TextEditingController _controladorFechafinal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var providerDomingos = Provider.of<ProviderDomingos>(context);

    return Center(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height:  Pantalla(context).altoDisp(0.6),
                      width: Pantalla(context).anchoDisp(6),
                      child: TextFormField(
                        controller: _controladorFechaInicial,
                        keyboardType: TextInputType.number,
                        enabled: false,
                        decoration:   const InputDecoration(
                          hintText: 'Fecha Inicial',
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
                    IconButton(onPressed: () async {
                      DateTime? fecha = await DatePicker.showSimpleDatePicker(
                      context,
                      initialDate: DateTime(2022),
                      firstDate: DateTime(0),
                      lastDate: DateTime(9999),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.es,
                      looping: true,
                      );

                      if(fecha != null) {
                        String fechaFormato = DateFormat('dd-MM-yyyy').format(fecha);
                        _controladorFechaInicial.text = fechaFormato;
                      }


                    }, icon: const Icon(Icons.date_range))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Pantalla(context).altoDisp(0.6),
                      width: Pantalla(context).anchoDisp(6),
                      child: TextFormField(
                        controller: _controladorFechafinal,
                        enabled: false,
                        keyboardType: TextInputType.number,
                        decoration:   const InputDecoration(
                          hintText: 'Fecha final',
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
                    IconButton(onPressed: () async {
                      DateTime? fecha = await DatePicker.showSimpleDatePicker(
                        context,
                        initialDate: DateTime(2022),
                        firstDate: DateTime(0),
                        lastDate: DateTime(9999),
                        dateFormat: "dd-MMMM-yyyy",
                        locale: DateTimePickerLocale.es,
                        looping: true,
                      );

                      if(fecha != null) {
                        String fechaFormato = DateFormat('dd-MM-yyyy').format(fecha);
                        _controladorFechafinal.text = fechaFormato;
                      }


                    }, icon: const Icon(Icons.date_range))
                  ],
                ),
              ),
              SizedBox(
                height: Pantalla(context).altoDisp(0.5),
                width: Pantalla(context).anchoDisp(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton(onPressed: () async {
                       if(_formKey.currentState!.validate()){
                         DateTime fi = DateFormat("dd-MM-yyyy").parse(_controladorFechaInicial.text);
                         DateTime ff = DateFormat("dd-MM-yyyy").parse(_controladorFechafinal.text);

                         if(fi.isAfter(ff)){
                           await FlutterPlatformAlert.showAlert(
                             windowTitle: '¡Ups!',
                             text: 'La fecha inicial no puede ser mayor a la fecha final',
                             alertStyle: AlertButtonStyle.ok,
                             iconStyle: IconStyle.information,
                           );
                         }


                         else{
                           providerDomingos.cantidadDomingos = 0;
                           providerDomingos.nuevasFechas(_controladorFechaInicial.text, _controladorFechafinal.text);
                         }

                       }
                     },
                       style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all<Color>(colores.principal),
                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                             const RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all( Radius.circular(18))

                             )
                         ),
                       ), child: Text("Calcular domingos", style: TextStyle(color: Colors.white, fontSize: Pantalla(context).tamagnoTexto(10)),),)

                  ],
                ),
              )
            ],
          )),
    );
  }
}
