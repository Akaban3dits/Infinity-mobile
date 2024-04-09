import 'package:flutter/material.dart';

class AppTextStyles {
  //*Primer estilo Coolvetica
  static const TextStyle h1s1 =
      TextStyle(fontSize: 32.0, fontFamily: 'Coolvetica');
  static const TextStyle h2s1 =
      TextStyle(fontSize: 24.0, fontFamily: 'Coolvetica');
  static const TextStyle h3s1 =
      TextStyle(fontSize: 20.0, fontFamily: 'Coolvetica');
  static const TextStyle h4s1 =
      TextStyle(fontSize: 16.0, fontFamily: 'Coolvetica');
  //* Segundo estilo Monofonto
  static const TextStyle h1s2 =
      TextStyle(fontSize: 32.0, fontFamily: 'Monofonto');
  static const TextStyle h2s2 =
      TextStyle(fontSize: 24.0, fontFamily: 'Monofonto');
  static const TextStyle h3s2 =
      TextStyle(fontSize: 20.0, fontFamily: 'Monofonto');
  static const TextStyle h4s2 =
      TextStyle(fontSize: 16.0, fontFamily: 'Monofonto');
}

class AppColorStyle {
  //*Fondo de pantalla
  static const Color primary = Color(0xff6717CD);
  //*Colores base para botones y contenedores
  static const Color secundary = Color(0xff0386D0);
  static const Color secundary2 = Color(0xff16045D);

  //* Extras para letras y mejorar la visibilidad
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  //! Alertas
  static const Color yellow = Color.fromARGB(255, 255, 230, 0);

  //! Unicamente puede ser usado para alertas prioritarias
  static const Color red = Colors.red;
}

class AppIconStyle {
  static const IconData home = Icons.home;
  static const IconData ver = Icons.remove_red_eye_outlined;
  static const IconData user = Icons.person;
  static const IconData money = Icons.attach_money;
  static const IconData accbox = Icons.account_box;
  static const IconData date = Icons.date_range;
  static const IconData settings = Icons.settings;
  static const IconData wallet = Icons.wallet;
  static const IconData swap = Icons.swap_vert_sharp;
  static const IconData person = Icons.person;
  static const IconData password = Icons.lock;
  static const IconData fingercheck = Icons.fingerprint;
  static const IconData info = Icons.info;
  static const IconData details = Icons.details;
  static const IconData key = Icons.vpn_key;
  static const IconData send = Icons.send;
  static const IconData withdraw = Icons.monetization_on;
  static const IconData arrowforward = Icons.arrow_forward_ios;
}