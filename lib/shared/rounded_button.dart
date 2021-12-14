import 'package:flutter/material.dart';

Widget RoundedButton(BuildContext context, String btnText, Function onPressed) {
  return ElevatedButton(
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(
          Size(MediaQuery.of(context).size.width * 0.7, 60)),
      padding: MaterialStateProperty.all(const EdgeInsets.all(18.0)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    ),
    onPressed: () {
      onPressed();
    },
    child: Text(
      btnText,
      style: const TextStyle(fontSize: 18.0),
    ),
  );
}
