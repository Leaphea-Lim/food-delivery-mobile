import 'package:material_ui/material_ui.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';

/// Enumeration of order and delivery status states.
enum OrderStatus {
  pending,
  confirmed,
  accepted,
  preparing,
  readyForPickup,
  pickedUp,
  inDelivery,
  completed,
  cancelled,
  rejected,
}

/// Status Badge component with custom colors and labels according to design system.
class StatusBadge extends StatelessWidget {
  final OrderStatus status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  String get label {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.confirmed:
        return 'Confirmed';
      case OrderStatus.accepted:
        return 'Accepted';
      case OrderStatus.preparing:
        return 'Preparing';
      case OrderStatus.readyForPickup:
        return 'Ready for Pickup';
      case OrderStatus.pickedUp:
        return 'Picked Up';
      case OrderStatus.inDelivery:
        return 'In Delivery';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.cancelled:
        return 'Cancelled';
      case OrderStatus.rejected:
        return 'Rejected';
    }
  }

  Color get textColor {
    switch (status) {
      case OrderStatus.pending:
        return AppColors.statusPending;
      case OrderStatus.confirmed:
      case OrderStatus.accepted:
        return AppColors.statusConfirmed;
      case OrderStatus.preparing:
      case OrderStatus.readyForPickup:
        return AppColors.statusPreparing;
      case OrderStatus.pickedUp:
      case OrderStatus.inDelivery:
        return AppColors.statusInDelivery;
      case OrderStatus.completed:
        return AppColors.statusCompleted;
      case OrderStatus.cancelled:
      case OrderStatus.rejected:
        return AppColors.statusCancelled;
    }
  }

  Color get backgroundColor {
    switch (status) {
      case OrderStatus.pending:
        return AppColors.statusPendingBg;
      case OrderStatus.confirmed:
      case OrderStatus.accepted:
        return AppColors.statusConfirmedBg;
      case OrderStatus.preparing:
      case OrderStatus.readyForPickup:
        return AppColors.statusPreparingBg;
      case OrderStatus.pickedUp:
      case OrderStatus.inDelivery:
        return AppColors.statusInDeliveryBg;
      case OrderStatus.completed:
        return AppColors.statusCompletedBg;
      case OrderStatus.cancelled:
      case OrderStatus.rejected:
        return AppColors.statusCancelledBg;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingSmall + 2,
        vertical: AppSizes.paddingTiny + 2,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.badgeRadius),
      ),
      child: Text(
        label,
        style: AppTextStyles.badge.copyWith(color: textColor),
      ),
    );
  }
}
