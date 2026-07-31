import 'dart:io';

import 'package:flutter/material.dart';

class ProfilePhotoPicker extends StatelessWidget {
  const ProfilePhotoPicker({
    super.key,
    this.imagePath,
    required this.onPickImage,
  });

  final String? imagePath;
  final VoidCallback onPickImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPickImage,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 52,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: imagePath != null &&
                        imagePath!.isNotEmpty
                    ? FileImage(File(imagePath!))
                    : null,
                child: imagePath == null ||
                        imagePath!.isEmpty
                    ? Icon(
                        Icons.person,
                        size: 52,
                        color: Colors.grey.shade500,
                      )
                    : null,
              ),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        TextButton.icon(
          onPressed: onPickImage,
          icon: const Icon(Icons.photo_camera_outlined),
          label: const Text(
            "Add Profile Photo (Optional)",
          ),
        ),
      ],
    );
  }
}