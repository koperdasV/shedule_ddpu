import 'package:flutter/material.dart';
import 'package:rozklad_ddpu/Pages/Profile/components/body.dart';
import 'package:rozklad_ddpu/components/my_bottom_nav_bar.dart';
import 'package:rozklad_ddpu/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: SizedBox(),
      centerTitle: true,
      title: Text(
        "Профіль",
        style: TextStyle(color: Colors.white),
      ),
      actions: [],
    );
  }
}
