import 'package:flutter/material.dart';

import '../utils/textfield_styles.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool isObscured;

  const LoginTextField(
      {Key? key,
        required this.controller,
        required this.hintText,
        this.validator,
        this.isObscured = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }

        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintStyle: ThemeTextStyle.loginTextFieldStyle,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      obscureText: isObscured,
    );
  }
}