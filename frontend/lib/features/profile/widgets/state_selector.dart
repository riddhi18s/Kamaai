import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../../../core/localization/india_location_data.dart';
import '../providers/profile_provider.dart';

class StateSelector extends ConsumerWidget {
  const StateSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    final states = getAllStates();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.state,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: profile.state.isEmpty ? null : profile.state,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          borderRadius: BorderRadius.circular(16),
          decoration: InputDecoration(
            hintText: context.l10n.selectState,
            prefixIcon: const Icon(
              Icons.map_outlined,
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
          items: states
              .map(
                (state) => DropdownMenuItem<String>(
                  value: state.code,
                  child: Text(
                    context.tr(state.localizationKey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value == null) return;

            if (value == profile.state) return;

            notifier.updateState(value);

            // Reset district when state changes
            notifier.updateDistrict("");
          },
        ),
      ],
    );
  }
}