import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../pdf/income_certificate_pdf_generator.dart';
import '../providers/kaam_khata_providers.dart';
import '../widgets/kaam_khata_bottom_nav.dart';
import '../widgets/kaam_khata_top_bar.dart';

/// Preview + generate/download a self-declared income certificate PDF,
/// built from the worker's all-time average monthly income in Kaam Khata.
class IncomeCertificateScreen extends ConsumerStatefulWidget {
  const IncomeCertificateScreen({
    super.key,
    this.workerName = 'Worker',
    this.address,
  });

  final String workerName;
  final String? address;

  @override
  ConsumerState<IncomeCertificateScreen> createState() =>
      _IncomeCertificateScreenState();
}

class _IncomeCertificateScreenState
    extends ConsumerState<IncomeCertificateScreen> {
  bool _isGenerating = false;

  String _certificateId() {
    final now = DateTime.now();
    final suffix = now.millisecondsSinceEpoch.toString();
    return 'KM-${now.year}-${suffix.substring(suffix.length - 6)}';
  }

  Future<void> _generate({required bool share}) async {
    setState(() => _isGenerating = true);

    try {
      final average = ref.read(averageMonthlyIncomeProvider);
      final generatedOn = DateTime.now();

      final file = await IncomeCertificatePdfGenerator.generate(
        certificateId: _certificateId(),
        workerName: widget.workerName,
        address: widget.address ?? '-',
        averageMonthlyIncome: average,
        generatedOn: generatedOn,
        validForDays: 30,
        disclaimer: context.l10n.kaamKhataCertificateDisclaimer,
      );

      if (!mounted) return;

      if (share) {
        await IncomeCertificatePdfGenerator.share(file);
      } else {
        await IncomeCertificatePdfGenerator.preview(file);
      }
    }  catch (e, stackTrace) {
  debugPrint("===== PDF ERROR =====");
  debugPrint(e.toString());
  debugPrint(stackTrace.toString());
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text( e.toString()
           
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isGenerating = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final average = ref.watch(averageMonthlyIncomeProvider);

    final currency = NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: 0,
    );

    final locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const KaamKhataTopBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.kaamKhataCertificateTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: AppSizes.lg),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.xl),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(
                  AppSizes.radiusXL,
                ),
                border: Border.all(
                  color: AppColors.border,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.kaamKhataCertificateSelfDeclared,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const Divider(height: AppSizes.xxl),

                  _InfoRow(
                    label: context.l10n.kaamKhataCertificateName,
                    value: widget.workerName,
                  ),

                  _InfoRow(
                    label: context.l10n.kaamKhataCertificateAvgIncome,
                    value: currency.format(average),
                  ),

                  _InfoRow(
                    label: context.l10n.kaamKhataCertificateGenerated,
                    value: DateFormat(
                      'd MMMM yyyy',
                      locale,
                    ).format(DateTime.now()),
                  ),

                  _InfoRow(
                    label: context.l10n.kaamKhataCertificateValidity,
                    value: context
                        .l10n
                        .kaamKhataCertificateValidityDays,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.xxl),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isGenerating
                        ? null
                        : () => _generate(share: false),
                    child: Text(
                      context.l10n.kaamKhataCertificatePreview,
                    ),
                  ),
                ),

                const SizedBox(width: AppSizes.md),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    onPressed: _isGenerating
                        ? null
                        : () => _generate(share: true),
                    child: _isGenerating
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.4,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            context
                                .l10n
                                .kaamKhataCertificateDownload,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const KaamKhataBottomNav(
        currentTab: KaamKhataTab.certificate,
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}