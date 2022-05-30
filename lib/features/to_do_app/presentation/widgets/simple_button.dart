import 'package:flutter/material.dart';

import '../design/colors.dart';
import '../design/text_styles.dart';

class SimpleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double width;
  final Color color;
  final Widget child;

  const SimpleButton._basic({
    Key? key,
    required this.onPressed,
    required this.width,
    required this.color,
    required this.child,
  }) : super(key: key);

  SimpleButton.standard({
    Key? key,
    VoidCallback? onPressed,
    Color color = Palette.primary,
    double width = 192.0,
    IconData? iconData,
    required String text,
  }) : this._basic(
          key: key,
          onPressed: onPressed,
          width: width,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyles.buttonFont,
              ),
              if (iconData != null)
                Icon(
                  iconData,
                  color: Colors.white,
                )
            ],
          ),
        );

   SimpleButton.showDialogOk({
    Key? key,
    VoidCallback? onPressed,
    Color color = Palette.secondary,
    double width = 100.0,
    IconData? iconData,
    required String text,
  }) : this._basic(
          key: key,
          onPressed: onPressed,
          width: width,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyles.buttonFont,
              ),
              if (iconData != null)
                Icon(
                  iconData,
                  color: Colors.white,
                )
            ],
          ),
        );

  const SimpleButton.custom({
    Key? key,
    VoidCallback? onPressed,
    Color color = Palette.secondary,
    double width = 192.0,
    required Widget child,
  }) : this._basic(
            key: key,
            onPressed: onPressed,
            width: width,
            color: color,
            child: child);

  static final _borderRadius = BorderRadius.circular(14.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      width: width,
      child: Material(
        color: color,
        borderRadius: _borderRadius,
        child: InkWell(
            borderRadius: _borderRadius, onTap: onPressed, child: child),
      ),
    );
  }
}
