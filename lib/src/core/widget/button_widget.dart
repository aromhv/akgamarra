import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Icon? icon;
  final Color? iconColor;
  final Color buttonColor;
  final String label;
  final Color labelColor;
  final VoidCallback onPressed;

  const ButtonWidget({
    super.key,
    this.icon,
    this.iconColor,
    required this.onPressed,
    required this.buttonColor,
    required this.label,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        minimumSize: const Size(0, 48),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[Icon(icon!.icon, color: iconColor), const SizedBox(width: 8)],
          Expanded(child: Text(label, style: TextStyle(color: labelColor), textAlign: TextAlign.center, softWrap: true)),
        ],
      ),
    );
  }
}
