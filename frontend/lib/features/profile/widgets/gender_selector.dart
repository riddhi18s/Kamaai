import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../providers/profile_provider.dart';

class GenderSelector extends ConsumerWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    final genders = <Map<String, String>>[
      {
        "value": "Male",
        "label": context.l10n.male,
      },
      {
        "value": "Female",
        "label": context.l10n.female,
      },
      {
        "value": "Other",
        "label": context.l10n.other,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.gender,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: profile.gender.isEmpty ? null : profile.gender,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          borderRadius: BorderRadius.circular(16),
          decoration: InputDecoration(
            hintText: context.l10n.selectGender,
            prefixIcon: const Icon(
              Icons.wc_rounded,
              color: Color(0xff2E7D32),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Color(0xff2E7D32),
                width: 2,
              ),
            ),
          ),
          items: genders
              .map(
                (gender) => DropdownMenuItem<String>(
                  value: gender["value"],
                  child: Text(gender["label"]!),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              notifier.updateGender(value);
            }
          },
        ),
      ],
    );
  }
}