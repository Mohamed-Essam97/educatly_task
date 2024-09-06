import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationService {
  static void showToast(String message, {Toast length = Toast.LENGTH_LONG}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
