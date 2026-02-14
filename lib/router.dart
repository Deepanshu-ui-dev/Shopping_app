import 'package:flutter/material.dart';
import 'package:shoping_app/features/auth/screens/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){

    case AuthScreen.routeName:
       return MaterialPageRoute(
        builder:(_)=> const AuthScreen());
    default:
      return MaterialPageRoute(
        builder: (_)=> const Scaffold(
          body:Center(
            child: Text('Screens does not exist'),
          )
        )
      ); 

  }
}