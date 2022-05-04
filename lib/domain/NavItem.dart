import 'package:flutter/material.dart';
import 'package:rozklad_ddpu/Pages/Chat/chat_page.dart';
import 'package:rozklad_ddpu/Pages/Home/home_page.dart';
import 'package:rozklad_ddpu/Pages/Profile/profile_page.dart';

class NavItem {
  final int id;
  final String icon;
  final Widget destination;

  NavItem({this.id, this.icon, this.destination});

  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

class NavItems extends ChangeNotifier {
  int selectedIndex = 0;

  void changeNavIndex({int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/icons/home.svg",
      destination: HomePage(),
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/list.svg",
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/chats.svg",
      destination: ChatPage(),
    ),
    NavItem(
      id: 4,
      icon: "assets/icons/clipboard.svg",
    ),
    NavItem(
      id: 5,
      icon: "assets/icons/user.svg",
      destination: ProfilePage(),
    ),
  ];
}
