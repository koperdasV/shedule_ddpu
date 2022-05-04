import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozklad_ddpu/Pages/Home/home_page.dart';
import 'package:rozklad_ddpu/Pages/Login/login_page.dart';
import 'package:rozklad_ddpu/domain/user.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? HomePage() : LoginPage();
  }
}
