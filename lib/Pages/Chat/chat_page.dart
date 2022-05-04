import 'package:flutter/material.dart';
import 'package:rozklad_ddpu/components/my_bottom_nav_bar.dart';
import 'package:rozklad_ddpu/constants.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: SizedBox(),
      centerTitle: true,
      title: Text(
        "Чат",
        style: TextStyle(color: Colors.white),
      ),
      actions: [],
    );
  }
}
