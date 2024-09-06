import 'package:educatly/ui/themes/ui_color.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: must_be_immutable
class LoadingWidget extends StatelessWidget {
  LoadingWidget({super.key, this.color, this.size});

  Color? color;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        size: size ?? 20,
        color: color ?? UIColor.kWhite,
      ),
    );
  }
}
