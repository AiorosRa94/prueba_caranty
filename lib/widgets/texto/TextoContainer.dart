
import 'package:flutter/material.dart';
import 'package:prueba_caranty/recursos/responsivo/pantalla.dart';

class TextoContainer extends StatelessWidget {
  final double? tamagnoTexto;
  final String texto;
  final Color? colorTexto, colorContenedor;
  final TextAlign? alineacionTexto;
  final FontWeight? pesoTexto;
  final double? paddingTexto;
  final double? altoContainer, anchoContainer;

   const TextoContainer({required this.texto,
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
    double altoCont = altoContainer ?? 1;
    double anchoCont = anchoContainer ?? 9;

    print("Tamagno pantalla ${Pantalla(context).anchoDisp(anchoCont)}");
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        color: colorContr,
        height: Pantalla(context).altoDisp(altoCont) ,
        width: Pantalla(context).anchoDisp(anchoCont),
        child: Text(texto, style: TextStyle(fontSize: tamagno, color:colorTxt, fontWeight: pesoTxt,),maxLines: 1, textAlign: alineacionTxt,
        ),
      ),
    );
  }
}
