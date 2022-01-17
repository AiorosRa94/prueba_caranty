import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:prueba_caranty/paginas/dashboard.dart';
import 'package:prueba_caranty/providers/providerAgnosBisiestos/providerAgnosBisiestos.dart';
import 'package:prueba_caranty/providers/providerBonus/providerBonus.dart';
import 'package:prueba_caranty/providers/providerCadena/providerCadena.dart';
import 'package:prueba_caranty/providers/providerDomingo/providerDomingos.dart';
import 'package:prueba_caranty/providers/providersClima/providersDatosClima.dart';
import 'providers/providerNavBar/providerNavBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive
    );


    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderNavBar>(create: (context) => ProviderNavBar()),
        ChangeNotifierProvider<ProviderDatosClima>(create: (context) => ProviderDatosClima()),
        ChangeNotifierProvider<ProviderDomingos>(create: (context) => ProviderDomingos()),
        ChangeNotifierProvider<ProviderAgnosBisiestos>(create: (context) => ProviderAgnosBisiestos()),
        ChangeNotifierProvider<ProviderCadena>(create: (context) => ProviderCadena()),
        ChangeNotifierProvider<ProviderBonus>(create: (context) => ProviderBonus()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prueba Caranty',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const Dashboard(),
      ),
    );
  }
}
