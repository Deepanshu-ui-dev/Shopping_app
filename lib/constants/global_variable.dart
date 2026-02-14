import 'package:flutter/material.dart';

class GlobalVariable {

  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 129, 201),
      Color.fromARGB(255, 50, 13, 172),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(43, 50, 239, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color.fromARGB(255, 142, 92, 38);
  static const unselectedNavBarColor = Colors.black87;

}