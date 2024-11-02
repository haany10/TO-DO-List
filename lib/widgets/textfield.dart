import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  String hinttext;
  TextEditingController controller;
  String? Function(String?)? validator;
  DefaultTextFormField({required this.controller , required this.hinttext , this.validator});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext
      ),
      validator: validator
    );
  }
}