import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../providers/profile_provider.dart';

class DobPicker extends ConsumerWidget {
  const DobPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    final dob = profile.dateOfBirth;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.dateOfBirthOptional,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),

        const SizedBox(height: 12),

        InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime(
                DateTime.now().year - 20,
              ),
              firstDate: DateTime(1950),
              lastDate: DateTime.now(),
            );

            if (picked != null) {
              notifier.updateDateOfBirth(picked);
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.grey.shade400,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.cake_outlined),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    dob == null
                        ? context.l10n.selectDateOfBirth
                        : DateFormat(
                            "dd MMM yyyy",
                          ).format(dob),
                    style: TextStyle(
                      color: dob == null
                          ? Colors.grey.shade600
                          : Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),

                const Icon(
                  Icons.calendar_month,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          context.l10n.optionalField,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}