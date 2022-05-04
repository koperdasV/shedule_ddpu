import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rozklad_ddpu/Pages/Login/login_page.dart';
import 'package:rozklad_ddpu/Pages/Signup/signup_page.dart';
import 'package:rozklad_ddpu/Pages/Welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rozklad_ddpu/components/rounded_button.dart';
import 'package:rozklad_ddpu/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Вітаю у додатку Розклад ДДПУ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "УВІЙТИ",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "ЗАРЕЄСТРУВАТИСЬ",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpPage();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
