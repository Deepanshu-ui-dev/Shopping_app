import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shoping_app/constants/global_variable.dart';
import 'package:shoping_app/features/auth/screens/auth_screen.dart';
import 'package:shoping_app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      themeMode: ThemeMode.light,
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: ShadZincColorScheme.light(
          primary: GlobalVariable.primaryColor,
          secondary: GlobalVariable.secondaryColor,
          accent: GlobalVariable.accentSoft,
          ring: GlobalVariable.secondaryColor,
        ),
      ),
      appBuilder: (context) {
        return MaterialApp(
          title: 'SHOPZI',
          debugShowCheckedModeBanner: false,
          theme: Theme.of(context),
          localizationsDelegates: const [
            GlobalShadLocalizations.delegate,
          ],
          builder: (context, child) {
            return ShadAppBuilder(child: child!);
          },
          onGenerateRoute: (settings) => generateRoute(settings),
          home: const AuthScreen(),
        );
      },
    );
  }
}
