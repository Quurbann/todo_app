import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/login/login.dart';
import 'package:todo_app/pages/onboarding/onboarding.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> checkFirstOpen() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isFirstOpen = prefs.getBool('isFirstOpen') ?? true;
    await Future.delayed(Duration(seconds: 2));
    if (isFirstOpen) {
      await prefs.setBool('isFirstOpen', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    }
  }

  @override
  void initState() {
    checkFirstOpen();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/logo/my_logo.svg'),
          SizedBox(height: 20,),
          Center(
            child: Text(
              'UpTodo',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}