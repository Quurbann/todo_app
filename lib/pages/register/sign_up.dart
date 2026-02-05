import 'package:flutter/material.dart';
import 'package:todo_app/pages/login/login.dart';
import 'package:todo_app/widgets/login_with.dart';
import 'package:todo_app/widgets/primary_button.dart';
import 'package:todo_app/widgets/text_fields.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, size: 24),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Register",
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
                  SizedBox(height: 26),
                  PrimaryTextField(
                    labelName: "Password",
                    hintText: "••••••••••••",
                    obscureText: true,
                    letterSpacing: 5,
                  ),
                  SizedBox(height: 26),
                  PrimaryTextField(
                    labelName: "Confirm Password",
                    hintText: "••••••••••••",
                    obscureText: true,
                  ),
                  SizedBox(height: 70),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
                          text: "Register",
                        ),
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
                        name: "Register with Google",
                      ),
                      SizedBox(height: 20),
                      LoginWith(
                        name: "Register with Apple",
                        icon: 'assets/svg/icons/apple.svg',
                      ),
                    ],
                  ),
                  SizedBox(height: 46),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Already have an account?",
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
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                        ),
                        child: Text(
                          "Login",
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
