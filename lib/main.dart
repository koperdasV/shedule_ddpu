import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozklad_ddpu/Pages/Landing/landing_page.dart';
import 'package:rozklad_ddpu/constants.dart';
import 'package:rozklad_ddpu/domain/NavItem.dart';
import 'package:rozklad_ddpu/domain/user.dart';
import 'package:rozklad_ddpu/services/auth.dart';

void main() => runApp(SheduleApp());

class SheduleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().currentUser,
      child: ChangeNotifierProvider(
        create: (context) => NavItems(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Розклад ДДПУ',
          theme: ThemeData(
              primaryColor: kPrimaryLightColor,
              textTheme:
                  TextTheme(headline6: TextStyle(color: kTextLightColor))),
          home: LandingPage(),
        ),
      ),
    );
  }
}
