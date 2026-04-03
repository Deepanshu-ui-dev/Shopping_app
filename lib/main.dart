import 'package:flutter/material.dart';
import 'package:shoping_app/features/auth/screens/auth_screen.dart';
import 'package:shoping_app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color:Colors.black,
          ),
        )
      ),
      onGenerateRoute:(settings)=> generateRoute(settings) ,
      home: const AuthScreen(),
    );
  }
}
