import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rozklad_ddpu/Pages/Login/components/background.dart';
import 'package:rozklad_ddpu/Pages/Signup/signup_page.dart';
import 'package:rozklad_ddpu/components/already_have_an_account_check.dart';
import 'package:rozklad_ddpu/components/rounded_button.dart';
import 'package:rozklad_ddpu/components/rounded_input_field.dart';
import 'package:rozklad_ddpu/components/rounded_pasword_field.dart';
import 'package:rozklad_ddpu/domain/user.dart';
import 'package:rozklad_ddpu/services/auth.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController =
        TextEditingController(); // змінна для email
    TextEditingController _passwordController =
        TextEditingController(); // змінна для паролю
    // ignore: unused_local_variable
    String _email;
    // ignore: unused_local_variable
    String _password;

    AuthService _authService = AuthService();

    void signInButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      User user = await _authService.signInWithEmailandPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg:
                "Вхід не можливий! Будь ласка, перевірте свою електронну адресу або пароль",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) {
        //     return HomePage();
        //   },
        // ));
      }
    }

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "ВХІД",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Ваш email",
              onChanged: (value) {},
              controller: _emailController,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              controller: _passwordController,
            ),
            RoundedButton(text: "УВІЙТИ", press: signInButtonAction),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
