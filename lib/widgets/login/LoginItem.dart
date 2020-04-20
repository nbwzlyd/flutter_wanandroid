import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginItem extends StatelessWidget {
  const LoginItem({Key key, this.hintText, this.controller, this.inputBorder})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final InputBorder inputBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: EdgeInsets.only(left: 16),
      color: Colors.white,
      child: TextField(
        decoration:
            new InputDecoration(hintText: hintText, border: inputBorder),
        maxLines: 1,
        controller: controller,
      ),
    );
  }
}
