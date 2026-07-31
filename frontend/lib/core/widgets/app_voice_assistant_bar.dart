import 'package:flutter/material.dart';

class AppVoiceAssistantBar extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final VoidCallback? onMicTap;

  const AppVoiceAssistantBar({
    super.key,
    required this.title,
    this.onTap,
    this.onMicTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              onPressed: onMicTap,
              icon: const Icon(
                Icons.mic,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}