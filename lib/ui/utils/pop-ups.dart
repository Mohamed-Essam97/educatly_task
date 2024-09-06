import 'package:flutter/material.dart';

extension BuildContextEntension<T> on BuildContext {
  Future<T?> showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return showModalBottomSheet(
      context: this,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      builder: (context) => Wrap(children: [child]),
    );
  }

  void showCustomDialog({Widget? child}) {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(18),
          contentPadding: EdgeInsets.zero,
          content: child,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
        );
      },
    );
  }
}
