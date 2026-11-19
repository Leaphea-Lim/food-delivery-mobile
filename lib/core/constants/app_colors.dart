import 'package:material_ui/material_ui.dart';

/// Centralized application color palette adhering to the Smart Food Delivery Design System.
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF5B21B6); // Primary 700
  static const Color primaryHover = Color(0xFF491896); // Primary 800
  static const Color primaryLight = Color(0xFFEDE9FE); // Primary 100

  // Secondary Colors
  static const Color secondary = Color(0xFF2ECC71); // Secondary 500
  static const Color secondaryHover = Color(0xFF22A559); // Secondary 600
  static const Color secondaryLight = Color(0xFFE8F8F0); // Secondary 100

  // Neutral / Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF9FAFB);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF777777);
  static const Color textMuted = Color(0xFF9E9E9E);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Borders & Dividers
  static const Color divider = Color(0xFFE0E0E0);
  static const Color border = Color(0xFFE5E7EB);
  static const Color inputBorder = Color(0xFFD1D5DB);

  // Status Badges & Alert Colors
  static const Color statusPending = Color(0xFFF59E0B); // Amber
  static const Color statusPendingBg = Color(0xFFFEF3C7);
  static const Color statusConfirmed = Color(0xFF3B82F6); // Blue
  static const Color statusConfirmedBg = Color(0xFFDBEAFE);
  static const Color statusPreparing = Color(0xFF8B5CF6); // Purple
  static const Color statusPreparingBg = Color(0xFFEDE9FE);
  static const Color statusInDelivery = Color(0xFF06B6D4); // Cyan
  static const Color statusInDeliveryBg = Color(0xFFCFFAFE);
  static const Color statusCompleted = Color(0xFF10B981); // Green
  static const Color statusCompletedBg = Color(0xFFD1FAE5);
  static const Color statusCancelled = Color(0xFFEF4444); // Red
  static const Color statusCancelledBg = Color(0xFFFEE2E2);

  // Feedback Colors
  static const Color success = Color(0xFF2ECC71);
  static const Color error = Color(0xFFE74C3C);
  static const Color warning = Color(0xFFF39C12);
  static const Color info = Color(0xFF3498DB);
}
