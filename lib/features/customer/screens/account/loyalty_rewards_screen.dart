import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../shared/shared_widgets.dart';
import '../../models/customer_mock_data.dart';
import '../../models/loyalty_model.dart';
import '../../widgets/account_widgets.dart';

/// Loyalty and Rewards៖ Points, Tier, ប្រវត្តិ Points និង Redeem
class LoyaltyRewardsScreen extends StatefulWidget {
  const LoyaltyRewardsScreen({super.key});

  @override
  State<LoyaltyRewardsScreen> createState() => _LoyaltyRewardsScreenState();
}

class _LoyaltyRewardsScreenState extends State<LoyaltyRewardsScreen> {
  int _points = CustomerMockData.startingPoints;
  late List<PointTransaction> _history;

  @override
  void initState() {
    super.initState();
    _history = List.of(CustomerMockData.pointHistory);
  }

  void _redeem(Reward reward) {
    showDialog<void>(
      context: context,
      builder: (ctx) => CustomDialog(
        title: 'Redeem reward',
        message: 'Use ${reward.pointsCost} points for "${reward.title}"?',
        confirmText: 'Redeem',
        onConfirm: () {
          Navigator.of(ctx).pop();
          setState(() {
            _points -= reward.pointsCost;
            _history = [
              PointTransaction(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                description: 'Redeemed: ${reward.title}',
                points: -reward.pointsCost,
                date: 'Today',
              ),
              ..._history,
            ];
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Redeemed: ${reward.title}')),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tier = LoyaltyTier.forPoints(_points);
    final next = LoyaltyTier.next(_points);
    final progress = next == null
        ? 1.0
        : (_points - tier.minPoints) / (next.minPoints - tier.minPoints);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CustomAppBar(title: 'Loyalty & Rewards'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
          children: [
            // Points + Tier
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Your points',
                        style: AppTextStyles.body
                            .copyWith(color: AppColors.textWhite),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.statusPendingBg,
                          borderRadius:
                              BorderRadius.circular(AppSizes.badgeRadius),
                        ),
                        child: Text(
                          tier.name,
                          style: AppTextStyles.badge
                              .copyWith(color: AppColors.statusPending),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$_points',
                    style: AppTextStyles.heading
                        .copyWith(fontSize: 44, color: AppColors.textWhite),
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress.clamp(0.0, 1.0),
                      minHeight: 8,
                      backgroundColor: Colors.white24,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.secondary),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    next == null
                        ? 'You reached the top tier!'
                        : '${next.minPoints - _points} points to ${next.name}',
                    style: AppTextStyles.caption
                        .copyWith(color: AppColors.textWhite),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Redeem
            Text('Redeem', style: AppTextStyles.titleLarge),
            const SizedBox(height: 12),
            AccountCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  for (var i = 0; i < CustomerMockData.rewards.length; i++) ...[
                    if (i > 0) const Divider(),
                    _RewardRow(
                      reward: CustomerMockData.rewards[i],
                      canRedeem:
                          _points >= CustomerMockData.rewards[i].pointsCost,
                      onRedeem: () => _redeem(CustomerMockData.rewards[i]),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),

            // History
            Text('Points history', style: AppTextStyles.titleLarge),
            const SizedBox(height: 12),
            AccountCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  for (var i = 0; i < _history.length; i++) ...[
                    if (i > 0) const Divider(),
                    _HistoryRow(item: _history[i]),
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

class _RewardRow extends StatelessWidget {
  const _RewardRow({
    required this.reward,
    required this.canRedeem,
    required this.onRedeem,
  });

  final Reward reward;
  final bool canRedeem;
  final VoidCallback onRedeem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.paddingMedium),
      child: Row(
        children: [
          const Icon(Icons.redeem, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reward.title,
                    style: AppTextStyles.body
                        .copyWith(fontWeight: FontWeight.w600)),
                Text('${reward.pointsCost} points',
                    style: AppTextStyles.caption),
              ],
            ),
          ),
          AppOutlineButton(
            text: 'REDEEM',
            width: 100,
            height: 36,
            onPressed: canRedeem ? onRedeem : null,
          ),
        ],
      ),
    );
  }
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.item});

  final PointTransaction item;

  @override
  Widget build(BuildContext context) {
    final earned = item.points > 0;
    return Padding(
      padding: const EdgeInsets.all(AppSizes.paddingMedium),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.description,
                    style: AppTextStyles.body
                        .copyWith(fontWeight: FontWeight.w600)),
                Text(item.date, style: AppTextStyles.caption),
              ],
            ),
          ),
          Text(
            '${earned ? '+' : ''}${item.points}',
            style: AppTextStyles.titleMedium.copyWith(
              color: earned ? AppColors.success : AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
