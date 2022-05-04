import 'package:flutter/material.dart';
import 'package:rozklad_ddpu/Pages/Profile/components/info.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Info(
          image: "assets/images/pic.png",
          name: "Василь Копердас",
          email: "koperdasb@gmail.com",
        ),
      ],
    );
  }
}
