import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_routes.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../models/auth_step.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_header.dart';
import '../widgets/password_step.dart';
import '../widgets/phone_step.dart';
import '../widgets/otp_step.dart';

/// Kamaai brand palette used only for visual styling in this screen.
class _KamaaiColors {
  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color lightGreen = Color(0xFFE8F5E9);
  static const Color background = Color(0xFFF6F8F5);
  static const Color accent = Color(0xFFFFB300);
}

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _verificationId;

  bool _isNewUser = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkExistingSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: _KamaaiColors.background,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 420,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Brand mark — purely decorative, no copy/logic involved.
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: _KamaaiColors.lightGreen,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: _KamaaiColors.primaryGreen.withOpacity(0.12),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.handshake_rounded,
                        color: _KamaaiColors.primaryGreen,
                        size: 34,
                      ),
                    ),

                    const SizedBox(height: 28),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 24,
                            offset: const Offset(0, 10),
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        transitionBuilder: (child, animation) {
                          final fade = CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOut,
                          );
                          final slide = Tween<Offset>(
                            begin: const Offset(0, 0.04),
                            end: Offset.zero,
                          ).animate(fade);
                          return FadeTransition(
                            opacity: fade,
                            child: SlideTransition(
                              position: slide,
                              child: child,
                            ),
                          );
                        },
                        child: Column(
  key: ValueKey("${auth.mode}_${auth.step}"),
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [

if (auth.step == AuthStep.phone) ...[
  Text(
    auth.mode == AuthMode.register
        ? "👋 Create your Kamaai Account"
        : "👋 Welcome Back",
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: _KamaaiColors.primaryGreen,
    ),
  ),

  const SizedBox(height: 12),

  Text(
    auth.mode == AuthMode.register
        ? "Let's verify your phone number to get started."
        : "Sign in with your phone number to continue.",
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16,
      color: Colors.grey.shade700,
      height: 1.5,
    ),
  ),

  const SizedBox(height: 28),
],

    _buildStep(auth.step),
  ],
),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStep(AuthStep step) {
    switch (step) {
      case AuthStep.phone:
        return Column(
          key: const ValueKey("phone"),
          children: [
            Column(
              children: [

                const SizedBox(height: 8),

                Text(
                  context.l10n.enterPhoneTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: _KamaaiColors.primaryGreen,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  context.l10n.enterPhoneSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 34),

                PhoneStep(
                  onSendOtp: _checkPhoneAndSendOtp,
                ),
              ],
            ),
          ],
        );

      case AuthStep.otp:
        return Column(
          key: const ValueKey("otp"),
          children: [
            AuthHeader(
              currentStep: 2,
              title: context.l10n.verifyOtp,
              subtitle: context.l10n.otpSubtitle,
            ),
            OtpStep(
              phoneNumber:
                  ref.read(authProvider).phoneNumber,
              onVerifyOtp: _verifyOtp,
              onResendOtp: _sendOtp,
            ),
          ],
        );

      case AuthStep.password:
        return Column(
          key: const ValueKey("password"),
          children: [
            AuthHeader(
              currentStep: 3,
              title: context.l10n.createPassword,
              subtitle: context.l10n.passwordSubtitle,
            ),
            PasswordStep(
              onContinue: _createPassword,
            ),
          ],
        );

      case AuthStep.voice:
        return const SizedBox.shrink();

      case AuthStep.completed:
        return const SizedBox.shrink();
    }
  }
Future<void> _checkPhoneAndSendOtp() async {
  final state = ref.read(authProvider);

  final phone = state.phoneNumber;
  debugPrint("Entered Phone: $phone");

  final query = await _firestore
      .collection("users")
      .where("phoneNumber", isEqualTo: phone)
      .limit(1)
      .get();
debugPrint("Users Found: ${query.docs.length}");
  if (query.docs.isNotEmpty) {
    if (!mounted) return;

    _showSnackBar(
      "This phone number is already registered. Please login.",
    );

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.login,
    );

    return;
  }

  await _sendOtp();
}
  Future<void> _sendOtp() async {
    final notifier = ref.read(authProvider.notifier);
    final state = ref.read(authProvider);

    final phone = "+91${state.phoneNumber}";

    notifier.setLoading(true);

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,

      timeout: const Duration(seconds: 60),

      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          await _auth.signInWithCredential(credential);

          notifier.setLoading(false);

          await _checkUserExists();
        } catch (e) {
          notifier.setLoading(false);

          _showSnackBar(
            "Verification failed.",
          );
        }
      },

      verificationFailed: (FirebaseAuthException e) {
        notifier.setLoading(false);

        _showSnackBar(
          e.message ?? "Unable to send OTP.",
        );
      },

      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;

        notifier.setLoading(false);

        notifier.nextStep();

        _showSnackBar(
          "OTP sent successfully.",
        );
      },

      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Future<void> _verifyOtp() async {
    final notifier = ref.read(authProvider.notifier);
    final otp = ref.read(authProvider).otp;

    if (_verificationId == null) {
      _showSnackBar(
        "Verification expired. Please request OTP again.",
      );
      return;
    }

    notifier.setLoading(true);

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);

      notifier.setLoading(false);

      await _checkUserExists();
    } on FirebaseAuthException catch (e) {
      notifier.setLoading(false);

      _showSnackBar(
        e.message ?? "Invalid OTP",
      );
    } catch (_) {
      notifier.setLoading(false);

      _showSnackBar(
        "Something went wrong.",
      );
    }
  }

  Future<void> _checkUserExists() async {
    final notifier = ref.read(authProvider.notifier);

    try {
      final uid = _auth.currentUser!.uid;

      final doc = await _firestore
          .collection("users")
          .doc(uid)
          .get();

      if (doc.exists) {
  _isNewUser = false;

  if (!mounted) return;

  _showSnackBar(
    "This phone number is already registered. Please login.",
  );

  Navigator.pushReplacementNamed(
    context,
    AppRoutes.login,
  );

  return;
}

      _isNewUser = true;

      notifier.goTo(AuthStep.password);
    } catch (e) {
  debugPrint("CHECK USER ERROR: $e");

  _showSnackBar(
    e.toString(),
  );
}
  }

  Future<void> _createPassword() async {
    if (!_isNewUser) return;

    final notifier = ref.read(authProvider.notifier);
    final state = ref.read(authProvider);

    notifier.setLoading(true);

    try {
      final uid = _auth.currentUser!.uid;

      await _firestore.collection("users").doc(uid).set({
        "uid": uid,
        "phoneNumber": state.phoneNumber,
        "password": state.password,
        "profileCompleted": false,
        "createdAt": FieldValue.serverTimestamp(),
        "lastLogin": FieldValue.serverTimestamp(),
        "language": "en",
      });

      notifier.setLoading(false);

      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.profileSetup,
      );
    } catch (e) {
  notifier.setLoading(false);

  debugPrint("CREATE ACCOUNT ERROR: $e");

  _showSnackBar(e.toString());
}
  }

  void _showSnackBar(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF2B2B2B),
        elevation: 6,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Row(
          children: [
            const Icon(
              Icons.info_outline_rounded,
              color: _KamaaiColors.accent,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkExistingSession() async {
    final user = _auth.currentUser;
    if (user == null) {
      return;
    }
    try {
      final doc = await _firestore
          .collection("users")
          .doc(user.uid)
          .get();
      if (!mounted) return;
      if (!doc.exists) {
        Navigator.pushReplacementNamed(
          context,
           AppRoutes.profileSetup,
        );
        return;
      }
      final data = doc.data();
      final profileCompleted =
          (data?["profileCompleted"] ?? false) as bool;
      await _firestore
          .collection("users")
          .doc(user.uid)
          .update({
        "lastLogin": FieldValue.serverTimestamp(),
      });
      if (!mounted) return;
      if (profileCompleted) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.dashboard,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
           AppRoutes.profileSetup,
        );
      }
    } catch (_) {}
  }

  Future<void> logout() async {
    await _auth.signOut();
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
         AppRoutes.authSelection,
      
      (route) => false,
    );
  }

  @override
  void dispose() {
    ref.read(authProvider.notifier).dispose();
    super.dispose();
  }
}