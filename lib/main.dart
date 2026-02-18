import 'package:flutter/material.dart';
import 'package:todo_app/pages/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff121212),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff121212),
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.transparent,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xff363636),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
