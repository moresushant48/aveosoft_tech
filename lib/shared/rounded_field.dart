import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget RoundedTextField(
  BuildContext context,
  TextEditingController controller, {
  String hintText = '',
  TextInputAction textInputAction = TextInputAction.next,
  textInputFormatter,
  TextInputType keyboardType = TextInputType.name,
  bool obsecureText = false,
  validator,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      inputFormatters: textInputFormatter ?? [],
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white10,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(34.0),
        ),
      ),
      validator: validator ?? (value) {},
    ),
  );
}
