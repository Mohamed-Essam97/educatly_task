import 'package:educatly/ui/themes/text_theme.dart';
import 'package:educatly/ui/widgets/text_utils/text_utils.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String message;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;

  const EmptyWidget({
    super.key,
    this.message = 'No data available',
    this.icon = Icons.hourglass_empty,
    this.iconSize = 50.0,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16.0),
          TextUtils(
            message,
            style: context.body1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
