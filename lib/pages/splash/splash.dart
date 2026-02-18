import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/index/home.dart';
import 'package:todo_app/pages/login/login.dart';
import 'package:todo_app/pages/onboarding/onboarding.dart';
import 'package:todo_app/providers/home_provider.dart';
import 'package:todo_app/providers/seen_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> checkAppFlow() async {
  final prefs = await SharedPreferences.getInstance();

  final bool isFirstOpen = prefs.getBool('isFirstOpen') ?? true;
  final bool hasSeenLogin = prefs.getBool('hasSeenLogin') ?? false;

  await Future.delayed(const Duration(seconds: 2));
  if(!mounted) return;

  if (isFirstOpen) {
    await prefs.setBool('isFirstOpen', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ChangeNotifierProvider(
        create: (_) => SeenProvider(),
        child: OnboardingPage())),
    );
  } 
  else if (!hasSeenLogin) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ChangeNotifierProvider(
        create: (_) => SeenProvider(),
        child: LoginPage())),
    );
  } 
  else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (_) => HomeProvider()..loadTodos(),
          child: HomePage(),
        ),
      ),
    );
  }
}

@override
void initState() {
  super.initState();
  checkAppFlow();
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