import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/extensions/locale_extensions.dart';
import '../../../core/services/location_service.dart';
import '../providers/profile_provider.dart';
import '../widgets/district_selector.dart';
import '../widgets/gender_selector.dart';
import '../widgets/occupation_selector.dart';
import '../widgets/state_selector.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() =>
      _ProfileSetupScreenState();
}

class _ProfileSetupScreenState
    extends ConsumerState<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  final LocationService _locationService = const LocationService();

  bool _isFetchingLocation = false;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(profileProvider);
    _nameController = TextEditingController(text: profile.name);
    _phoneController = TextEditingController(text: profile.phoneNumber);
    _addressController = TextEditingController(text: profile.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _detectLocation() async {
    setState(() => _isFetchingLocation = true);

    try {
      final Position position =
          await _locationService.getCurrentLocation();

      ref.read(profileProvider.notifier).updateLocation(
            latitude: position.latitude,
            longitude: position.longitude,
          );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Location updated successfully.")),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) setState(() => _isFetchingLocation = false);
    }
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final notifier = ref.read(profileProvider.notifier);
    notifier.updateName(_nameController.text.trim());
    notifier.updateAddress(_addressController.text.trim());

    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final profile = ref.read(profileProvider);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set({
        "uid": uid,
        "name": _nameController.text.trim(),
        "phoneNumber": _phoneController.text.trim(),
        "address": _addressController.text.trim(),
        "gender": profile.gender,           // ← .name hata diya
        "occupation": profile.occupation,   // ← .name hata diya
        "state": profile.state,
        "district": profile.district,
        "latitude": profile.latitude,
        "longitude": profile.longitude,
        "profileCompleted": true,
        "lastLogin": FieldValue.serverTimestamp(),
        "updatedAt": FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      notifier.markProfileCompleted();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile Saved Successfully")),
      );

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.dashboard,
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  InputDecoration _inputDecoration({
    required BuildContext context,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: const Color(0xff2E7D32)),
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xff2E7D32),
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 20),

              // ── Profile Photo ────────────────────────────
              Center(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: const Color(0xffE8F5E9),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xff2E7D32),
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.person_rounded,
                            size: 55,
                            color: Color(0xff2E7D32),
                          ),
                        ),
                        Positioned(
                          bottom: -2,
                          right: -2,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              // Camera/Gallery Picker — baad me
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Color(0xff2E7D32),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add_a_photo_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      context.l10n.profilePhotoOptional,
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Title ────────────────────────────────────
              Text(
                context.l10n.profileTitle,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                context.l10n.profileSubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 35),

              // ── Personal Details ─────────────────────────
              Text(
                context.l10n.personalDetails.toUpperCase(),
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration(
                  context: context,
                  label: context.l10n.fullName,
                  icon: Icons.person_outline_rounded,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return context.l10n.enterName;
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _phoneController,
                enabled: false,
                decoration: _inputDecoration(
                  context: context,
                  label: context.l10n.phoneNumber,
                  icon: Icons.phone_outlined,
                ),
              ),

              const SizedBox(height: 30),

              // ── About You ────────────────────────────────
              Text(
                context.l10n.aboutYou.toUpperCase(),
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 15),

              GenderSelector(),

              const SizedBox(height: 20),

              const OccupationSelector(),

              const SizedBox(height: 30),

              // ── Location ─────────────────────────────────
              Text(
                context.l10n.locationSection.toUpperCase(),
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 15),

              const StateSelector(),

              const SizedBox(height: 20),

              const DistrictSelector(),

              const SizedBox(height: 20),

              TextFormField(
                controller: _addressController,
                minLines: 3,
                maxLines: 5,
                decoration: _inputDecoration(
                  context: context,
                  label: context.l10n.fullAddress,
                  icon: Icons.home_outlined,
                ).copyWith(alignLabelWithHint: true),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return context.l10n.enterAddress;
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              // ── Live Location Card ───────────────────────
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.my_location),
                          SizedBox(width: 10),
                          Text(
                            "Live Location",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Icon(
                            profile.locationEnabled
                                ? Icons.check_circle
                                : Icons.location_off,
                            color: profile.locationEnabled
                                ? Colors.green
                                : Colors.red,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              profile.locationEnabled
                                  ? "Location Enabled"
                                  : "Location Not Enabled",
                            ),
                          ),
                        ],
                      ),

                      if (profile.locationEnabled) ...[
                        const SizedBox(height: 12),
                        // ← Fix: DateTime properly format kiya
                        Text(
                          profile.lastLocationUpdate != null
                              ? "Last Updated: ${DateFormat('dd MMM yyyy, hh:mm a').format(profile.lastLocationUpdate!)}"
                              : "Last Updated: N/A",
                        ),
                      ],

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: _isFetchingLocation
                              ? null
                              : _detectLocation,
                          icon: _isFetchingLocation
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.gps_fixed),
                          label: Text(
                            profile.locationEnabled
                                ? "Refresh Location"
                                : "Enable Live Location",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.icon(
                  onPressed: _saveProfile,
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: Text(
                    context.l10n.profileContinue,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xff2E7D32),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}