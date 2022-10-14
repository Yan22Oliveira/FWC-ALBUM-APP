import 'package:flutter/material.dart';

import '../styles/colors_app.dart';

class RoundedButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPressed;

  const RoundedButton({
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: const CircleBorder(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.colors.white,
        ),
        child: IconButton(
          icon: Icon(
            icon,
            color: context.colors.greyDart,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
  
}
