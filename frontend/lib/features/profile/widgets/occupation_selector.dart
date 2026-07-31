import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/occupation_data.dart';
import '../../../core/extensions/locale_extensions.dart';
import '../providers/profile_provider.dart';

class OccupationSelector extends ConsumerWidget {
  const OccupationSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    final occupations = getAllOccupations();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.occupation,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: profile.occupation.isEmpty ? null : profile.occupation,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          borderRadius: BorderRadius.circular(16),
          decoration: InputDecoration(
            hintText: context.l10n.selectOccupation,
            prefixIcon: const Icon(
              Icons.work_outline_rounded,
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
          items: occupations.map((occupation) {
            return DropdownMenuItem<String>(
              value: occupation.id,
              child: Text(
                occupation.id,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              notifier.updateOccupation(value);
            }
          },
        ),
      ],
    );
  }
}