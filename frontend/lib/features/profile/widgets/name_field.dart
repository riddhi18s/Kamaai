import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../providers/profile_provider.dart';

class NameField extends ConsumerWidget {
  const NameField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    return TextField(
      controller: notifier.nameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      onChanged: notifier.updateName,
      decoration: InputDecoration(
        labelText: context.l10n.fullName,
        hintText: context.l10n.enterFullName,
        prefixIcon: const Icon(Icons.person_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        errorText: profile.name.isEmpty
            ? null
            : profile.name.trim().length < 3
                ? context.l10n.invalidName
                : null,
      ),
    );
  }
}