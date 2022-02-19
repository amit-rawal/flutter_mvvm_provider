import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

/// Indicates if flushbar is going to start at the [TOP] or at the [BOTTOM]
enum AlertBarPosition { TOP, BOTTOM }

class AlertBar {
  static void show(
    BuildContext context, {
    required String title,
    required String description,
    AlertBarPosition? position = AlertBarPosition.BOTTOM,
    int? durationInMilliseconds = 3000, //by default duration is 3 seconds
    Color backgroundColor = Colors.black,
  }) {
    Flushbar(
      title: title,
      message: description,
      duration: Duration(seconds: durationInMilliseconds!),
      flushbarPosition: (position == AlertBarPosition.TOP)
          ? FlushbarPosition.TOP
          : FlushbarPosition.BOTTOM,
      backgroundColor: backgroundColor,
    ).show(context);
  }
}
