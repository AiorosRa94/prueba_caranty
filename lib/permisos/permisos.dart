import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as hdl;

class Permisos with ChangeNotifier{

  Location gps =  Location();



  Future<bool> getPermisoGPS() async {
    bool respuesta = false;
    PermissionStatus  _permisos = await gps.hasPermission();

    if (_permisos == PermissionStatus.denied) {
      respuesta = false;
      await Location.instance.requestPermission();
    } else if (_permisos == PermissionStatus.deniedForever) {
      respuesta = false;
      await hdl.openAppSettings();
    }
     else if (_permisos == PermissionStatus.granted) {
      respuesta = true;
     }

    return respuesta;
  }

}