import 'package:flutter/material.dart';
import 'package:rozklad_ddpu/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        login ? "У вас немає акаунта ? " : "У вас вже є акаунт ? ",
        style: TextStyle(color: kPrimaryColor),
      ),
      GestureDetector(
        onTap: press,
        child: Text(
          login ? "Зареєструватись" : "Увійти",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
