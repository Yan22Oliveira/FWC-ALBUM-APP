import 'package:flutter/material.dart';

import '../styles/button_styles.dart';
import '../styles/text_styles.dart';

class Button extends StatelessWidget {

  final ButtonStyle buttonStyle;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool outline;

  const Button({
    required this.buttonStyle,
    required this.labelStyle,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
    this.outline = false,
    Key? key,
  }) : super(key: key);

  Button.primary({
    required this.label,
    this.width,
    this.height,
    this.onPressed,
    super.key,
  }) :  buttonStyle = ButtonStyles.instance.primaryButton,
        labelStyle = TextStyles.instance.textSecondaryFontExtraBold,
        outline = false;

  @override
  Widget build(BuildContext context) {

    final labelText = Text(
      label,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
    );

    return SizedBox(
      width: width,
      height: height,
      child: outline?
      OutlinedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: labelText,
      ):
      ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: labelText,
      ),
    );
  }

}
