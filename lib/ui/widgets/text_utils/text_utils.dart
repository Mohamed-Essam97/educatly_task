import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool shouldTrim;
  final int trimLines;
  final int trimLength; // Trim by character count
  final TextAlign textAlign;

  const TextUtils(
    this.text, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.shouldTrim = true, // By default, trimming is on
    this.trimLines = 1, // Default is 1 line for line-based trimming
    this.trimLength = 100, // Default character length limit
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If shouldTrim is true, trim text based on character count
    String displayText = shouldTrim && text.length > trimLength
        ? '${text.substring(0, trimLength)}...'
        : text;

    return Text(
      displayText,
      style: style ?? DefaultTextStyle.of(context).style,
      textAlign: textAlign,
      maxLines: shouldTrim ? trimLines : null, // Trim based on lines if needed
      overflow: shouldTrim ? TextOverflow.ellipsis : TextOverflow.visible,
    );
  }
}
