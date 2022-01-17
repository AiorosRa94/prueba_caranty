import 'package:flutter/material.dart';

class PruebaMatriz extends StatelessWidget {
  const PruebaMatriz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.timer,color: Colors.red,),
          Text("Sin pruebas"),
        ],
      ),
    );
  }
}
