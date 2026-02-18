import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/index/home.dart';
import 'package:todo_app/pages/register/sign_up.dart';
import 'package:todo_app/widgets/primary_button.dart';
import 'package:todo_app/widgets/text_fields.dart';
import 'package:todo_app/widgets/login_with.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
void initState() {
  super.initState();
  saveLoginSeen();
}

Future<void> saveLoginSeen() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('hasSeenLogin', true);
}


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 41),
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.87),
                    ),
                  ),
                  SizedBox(height: 53),
                  PrimaryTextField(
                    hintText: "Enter your Username",
                    labelName: "Username",
                    obscureText: false,
                  ),
                  SizedBox(height: 25),
                  PrimaryTextField(
                    labelName: "Password",
                    hintText: "••••••••••••",
                    obscureText: true,
                    letterSpacing: 5,
                  ),
                  SizedBox(height: 70),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(text: "Login", onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color(0xff979797),
                          thickness: 1,
                          endIndent: 2,
                        ),
                      ),
                      Text(
                        "or",
                        style: TextStyle(
                          color: Color(0xff979797),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xff979797),
                          thickness: 1,
                          indent: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      LoginWith(
                        icon: 'assets/svg/icons/google.svg',
                        name: "Login with Google",
                      ),
                      SizedBox(height: 20),
                      LoginWith(
                        name: "Login with Apple",
                        icon: 'assets/svg/icons/apple.svg',
                      ),
                    ],
                  ),
                  SizedBox(height: 46),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Don't have an acoount?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        }, 
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
