import 'package:educatly/ui/themes/text_theme.dart';
import 'package:educatly/ui/themes/ui_color.dart';
import 'package:educatly/ui/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomOutLineButton extends HookWidget {
  final bool localize;
  final bool busy;
  final bool bold;
  final double? width;
  final double height;
  final double radius;
  final double elevation;
  final String text;
  final Widget? child;

  final Color? backGroundColor, borderColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function onPressed;

  const CustomOutLineButton({
    super.key,
    this.busy = false,
    this.localize = true,
    required this.onPressed,
    this.child,
    required this.text,
    this.width,
    this.backGroundColor,
    this.borderColor = UIColor.kWhite,
    this.height = 50, // Default height
    this.elevation = 0,
    this.radius = 24,
    this.margin = const EdgeInsets.symmetric(vertical: 5),
    this.padding = const EdgeInsets.symmetric(
        horizontal: 10, vertical: 12), // Padding adjusted for height
    this.bold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          onPressed: () => onPressed(),
          style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                side: WidgetStateProperty.all(
                    BorderSide(color: borderColor!, width: 1.0)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius))),
              ),
          child: child ??
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height < 50 ? 4.0 : 12.0,
                    horizontal: 10.0), // Adjust padding based on height
                child: busy
                    ? LoadingWidget(
                        color: UIColor.kSecondry,
                      )
                    : Text(
                        text,
                        style: context.button!.copyWith(
                          color: borderColor ?? UIColor.kWhite,
                          fontSize: height < 30
                              ? 10
                              : null, // Adjust font size if the height is small
                        ),
                        overflow: TextOverflow.ellipsis, // Handle overflow
                        maxLines: 1, // Limit to one line if height is small
                      ),
              ),
        ),
      ),
    );
  }
}
