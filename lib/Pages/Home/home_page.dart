import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rozklad_ddpu/Pages/Home/components/body.dart';
import 'package:rozklad_ddpu/components/my_bottom_nav_bar.dart';
import 'package:rozklad_ddpu/constants.dart';
import 'package:rozklad_ddpu/services/auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: buildAppBar(),
        body: Body(),
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Розклад ДДПУ',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        Icons.schedule_sharp,
        color: Colors.white, //треба буде змінити на лого додатку
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/logout-variant.svg",
            color: Colors.white,
          ),
          onPressed: () {
            AuthService().signOut();
          },
        ),
      ],
    );
  }
}
