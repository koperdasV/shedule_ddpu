import 'package:flutter/material.dart';
import 'package:rozklad_ddpu/components/text_field_container.dart';
import 'package:rozklad_ddpu/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
