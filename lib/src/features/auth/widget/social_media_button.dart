import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String buttonText;
  final VoidCallback onPressed;

  const SocialMediaButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.buttonText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: color,
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          /*
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 5,
         */
        ),
        onPressed: onPressed,
        icon: FaIcon(icon, color: color, size: 24),
        label: Text(
          buttonText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ),
    );
  }
}
