import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../shared/shared_widgets.dart';
import '../../models/customer_mock_data.dart';
import '../../widgets/account_widgets.dart';

/// Referral program៖ កូដ referral (Copy/Share) និងការពន្យល់រង្វាន់
class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  Future<void> _copy(BuildContext context) async {
    await Clipboard.setData(
      const ClipboardData(text: CustomerMockData.referralCode),
    );
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Referral code copied')),
    );
  }

  @override
  Widget build(BuildContext context) {
    const steps = [
      ('Share your code', 'Send your referral code to friends.'),
      ('Friend orders', 'They sign up and place their first order.'),
      ('Both get rewarded', 'You and your friend each earn 100 points.'),
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CustomAppBar(title: 'Referral Program'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.card_giftcard,
                    size: 56, color: AppColors.primary),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Invite friends, earn points',
              textAlign: TextAlign.center,
              style: AppTextStyles.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Earn 100 points for every friend who joins and orders with your code.',
              textAlign: TextAlign.center,
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 24),
            AccountCard(
              child: Column(
                children: [
                  Text('Your referral code', style: AppTextStyles.caption),
                  const SizedBox(height: 8),
                  Text(
                    CustomerMockData.referralCode,
                    style: AppTextStyles.heading
                        .copyWith(fontSize: 30, letterSpacing: 3),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: AppOutlineButton(
                          text: 'COPY',
                          height: AppSizes.buttonHeightSmall,
                          icon: const Icon(Icons.copy,
                              size: 18, color: AppColors.primary),
                          onPressed: () => _copy(context),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SecondaryButton(
                          text: 'SHARE',
                          height: AppSizes.buttonHeightSmall,
                          icon: const Icon(Icons.share,
                              size: 18, color: Colors.white),
                          onPressed: () {
                            // TODO: ភ្ជាប់ share sheet ពេល Implement ពិត
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Share (UI only)'),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('How it works', style: AppTextStyles.titleLarge),
            const SizedBox(height: 12),
            AccountCard(
              child: Column(
                children: [
                  for (var i = 0; i < steps.length; i++) ...[
                    if (i > 0) const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${i + 1}',
                            style: AppTextStyles.badge
                                .copyWith(color: AppColors.textWhite),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(steps[i].$1,
                                  style: AppTextStyles.body.copyWith(
                                      fontWeight: FontWeight.w600)),
                              Text(steps[i].$2, style: AppTextStyles.caption),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
