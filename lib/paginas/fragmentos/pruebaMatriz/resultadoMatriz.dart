import 'package:flutter/material.dart';

class ResultadoMatriz extends StatelessWidget {
  const ResultadoMatriz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.timer,color: Colors.red,),
          Text("Sin resultados"),
        ],
      ),
    );
  }
}
