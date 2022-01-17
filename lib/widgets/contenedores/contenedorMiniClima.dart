import 'package:flutter/material.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';

class ContenedorMiniClima extends StatelessWidget {
  final double? tamagnoTexto;
  final String textoFecha, textoTemp;
  final Color? colorTexto, colorContenedor;
  final TextAlign? alineacionTexto;
  final FontWeight? pesoTexto;
  final double? paddingTexto;
  final double? altoContainer, anchoContainer;

  const ContenedorMiniClima({required this.textoFecha, required this.textoTemp,
    this.tamagnoTexto, this.colorTexto,
    this.alineacionTexto, this.pesoTexto,
    this.paddingTexto, this.altoContainer,
    this.anchoContainer, this.colorContenedor});

  @override
  Widget build(BuildContext context) {

    double tamagno= tamagnoTexto != null ? Pantalla(context).tamagnoTexto(tamagnoTexto!) : Pantalla(context).tamagnoTexto(10);
    Color colorTxt = colorTexto ?? Colors.black;
    Color colorContr = colorContenedor ?? Colors.transparent;

    TextAlign alineacionTxt = alineacionTexto ?? TextAlign.start;
    FontWeight pesoTxt = pesoTexto ?? FontWeight.normal;
    double padding = paddingTexto ?? 0;
    double altoCont = altoContainer ?? 0.75;
    double anchoCont = anchoContainer ?? 3;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        color: colorContr,
        height: Pantalla(context).altoDisp(altoCont) ,
        width: Pantalla(context).anchoDisp(anchoCont),
        child: Column(
          children: [
            Text(textoFecha, style: TextStyle(fontSize: tamagno, color:colorTxt, fontWeight: pesoTxt,),maxLines: 1, textAlign: alineacionTxt,),
            const Icon(Icons.cloud),
            Text("$textoTemp°", style: TextStyle(fontSize: tamagno, color:colorTxt, fontWeight: pesoTxt,),maxLines: 1, textAlign: alineacionTxt,),
          ],
        ),
        ),
    );
  }
}

