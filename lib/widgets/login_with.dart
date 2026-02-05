import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/pages/login/login.dart';

class LoginWith extends StatelessWidget {

  final String name;
  final String icon;

  const LoginWith({
    required this.name,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xff8875FF)),
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                SvgPicture.asset(icon),
                SizedBox(width: 10,),
                Text(name, style: TextStyle(color: Colors.white.withValues(alpha: 0.87)),)
              ],
            ),
          )
        ),
      ],
    );
  }
}
