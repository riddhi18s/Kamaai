import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../../../core/localization/india_location_data.dart';
import '../providers/profile_provider.dart';

class DistrictSelector extends ConsumerWidget {
  const DistrictSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    final districts = profile.state.isEmpty
        ? []
        : getDistricts(profile.state);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.district,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),

        const SizedBox(height: 10),

        DropdownButtonFormField<String>(
          value: profile.district.isEmpty
              ? null
              : profile.district,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          borderRadius: BorderRadius.circular(16),
          decoration: InputDecoration(
            hintText: context.l10n.selectDistrict,
            prefixIcon: Icon(
              Icons.location_city_outlined,
              color: profile.state.isEmpty
                  ? Colors.grey
                  : const Color(0xff2E7D32),
            ),
            filled: true,
            fillColor: profile.state.isEmpty
                ? Colors.grey.shade100
                : Colors.grey.shade50,
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
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
          items: districts
              .map(
                (district) => DropdownMenuItem<String>(
                  value: district.code,
                 child: Text(
  context.tr(district.localizationKey),
  overflow: TextOverflow.ellipsis,
),
                ),
              )
              .toList(),
          onChanged: profile.state.isEmpty
              ? null
              : (value) {
                  if (value == null) return;
                  notifier.updateDistrict(value);
                },
        ),
      ],
    );
  }
}