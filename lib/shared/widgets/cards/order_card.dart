import 'package:material_ui/material_ui.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/formatters.dart';
import '../badges/status_badge.dart';

/// Reusable order summary card used across Customer, Driver, and Restaurant views.
class OrderCard extends StatelessWidget {
  final String orderId;
  final String dateText;
  final OrderStatus status;
  final int itemCount;
  final double totalAmount;
  final String? restaurantOrCustomerName;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.dateText,
    required this.status,
    required this.itemCount,
    required this.totalAmount,
    this.restaurantOrCustomerName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.paddingMedium),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order ID & Status Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Formatters.formatOrderId(orderId),
                  style: AppTextStyles.titleMedium.copyWith(fontSize: 16),
                ),
                StatusBadge(status: status),
              ],
            ),
            const SizedBox(height: AppSizes.paddingSmall),
            if (restaurantOrCustomerName != null) ...[
              Text(
                restaurantOrCustomerName!,
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
            ],
            Text(
              dateText,
              style: AppTextStyles.caption,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.paddingSmall),
              child: Divider(),
            ),
            // Item count & Total Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$itemCount ${itemCount > 1 ? 'items' : 'item'}',
                  style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                ),
                Text(
                  Formatters.formatCurrency(totalAmount),
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
