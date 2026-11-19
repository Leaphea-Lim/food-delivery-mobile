import 'package:material_ui/material_ui.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../buttons/primary_button.dart';

/// Reusable empty state view when no items or search results exist.
class EmptyStateView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? actionButtonText;
  final VoidCallback? onAction;

  const EmptyStateView({
    super.key,
    this.icon = Icons.inbox_outlined,
    required this.title,
    required this.description,
    this.actionButtonText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 64,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: AppSizes.paddingLarge),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.titleMedium.copyWith(fontSize: 20),
            ),
            const SizedBox(height: AppSizes.paddingSmall),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextStyles.subtitle,
            ),
            if (actionButtonText != null && onAction != null) ...[
              const SizedBox(height: AppSizes.paddingLarge),
              SizedBox(
                width: 200,
                child: PrimaryButton(
                  text: actionButtonText!,
                  onPressed: onAction,
                  height: AppSizes.buttonHeightSmall,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
