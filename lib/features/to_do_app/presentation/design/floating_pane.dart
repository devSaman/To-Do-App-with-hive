import 'package:flutter/material.dart';

class FloatingPane extends Container {
  FloatingPane({
    Key? key,
    double? height,
    double? width,
    double radius = 14.0,
    Color color = Colors.white,
    EdgeInsets? padding,
    required Widget child,
  }) : super(
          key: key,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.12),
                  spreadRadius: 0.0,
                  blurRadius: 12.0)
            ],
          ),
          child: Material(
            color: color,
            child: Container(
              child: child,
              width: width,
              height: height,
              padding: padding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        );
}
