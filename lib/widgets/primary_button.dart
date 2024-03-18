import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? width;
  final bool expanded;
  final bool shadow;

  const PrimaryButton({
    required this.text,
    this.onPressed,
    this.width,
    this.expanded = false,
    this.shadow = false,
  }) : assert(width == null || expanded == false, 'Cannot provide both width and expanded at the same time\n\n');

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: expanded
          ? double.infinity
          : width != null
              ? width
              : 186,
      height: 41,
      decoration: BoxDecoration(
        color: onPressed == null ? Colors.blue.withOpacity(0.25) : Colors.blue,
        borderRadius: BorderRadius.circular(37),
        boxShadow: [
          if (shadow)
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 3,
              color: Colors.black.withOpacity(0.09),
            ),
        ],
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith((_) => Colors.transparent),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}