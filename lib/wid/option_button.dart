import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;
  final bool showFeedback;

  const OptionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
    this.isCorrect = false,
    this.showFeedback = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.white;
    IconData? icon;
    Color iconColor = Colors.transparent;

    if (showFeedback) {
      if (isCorrect) {
        bgColor = Colors.green[100]!;
        icon = Icons.check_circle;
        iconColor = Colors.green;
      } else if (isSelected) {
        bgColor = Colors.red[100]!;
        icon = Icons.cancel;
        iconColor = Colors.red;
      } else {
        bgColor = Colors.grey[100]!;
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
            if (showFeedback && icon != null)
              Icon(icon, color: iconColor)
          ],
        ),
      ),
    );
  }
}
