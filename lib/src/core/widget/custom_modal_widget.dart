import 'package:flutter/material.dart';

class CustomModalWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;

  const CustomModalWidget({super.key, required this.title, required this.content, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            content,
            const SizedBox(height: 24),
            Row(children: actions),
          ],
        ),
      ),
    );
  }
}
