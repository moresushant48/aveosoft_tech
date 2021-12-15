// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Future<Widget?> OverlayLoading(BuildContext context) {
  return showDialog<Widget>(
    context: context,
    barrierColor: Colors.black12.withOpacity(0.6),
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: const SizedBox.expand(
          child: SizedBox.expand(
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      );
    },
  );
}
