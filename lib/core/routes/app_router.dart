import 'package:material_ui/material_ui.dart';

import '../../features/auth/screens/auth_landing_screen.dart';
import '../../features/auth/screens/email_flow_screen.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/reset_password_screen.dart';
import '../../features/auth/screens/verify_otp_screen.dart';
import '../../features/auth/screens/welcome_screen.dart';
import '../../features/customer/models/saved_address_model.dart';
import '../../features/customer/screens/account/account_profile_screen.dart';
import '../../features/customer/screens/account/add_address_screen.dart';
import '../../features/customer/screens/account/add_payment_method_screen.dart';
import '../../features/customer/screens/account/loyalty_rewards_screen.dart';
import '../../features/customer/screens/account/payment_methods_screen.dart';
import '../../features/customer/screens/account/referral_screen.dart';
import '../../features/customer/screens/account/saved_addresses_screen.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_text_styles.dart';
import 'app_routes.dart';

/// Central application route generator and navigator.
class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // -----------------------------------------------------------------------
      // Auth Routes
      // -----------------------------------------------------------------------
      case AppRoutes.welcome:
        return _buildRoute(const WelcomeScreen(), settings);

      case AppRoutes.authLanding:
        return _buildRoute(const AuthLandingScreen(), settings);

      case AppRoutes.login:
        return _buildRoute(const LoginScreen(), settings);

      case AppRoutes.register:
        return _buildRoute(const RegisterScreen(), settings);

      case AppRoutes.forgotPassword:
        return _buildRoute(const ForgotPasswordScreen(), settings);

      case AppRoutes.verifyOtp:
        final email = (settings.arguments as String?) ?? 'user@example.com';
        return _buildRoute(VerifyOtpScreen(email: email), settings);

      case AppRoutes.resetPassword:
        return _buildRoute(const ResetPasswordScreen(), settings);

      case AppRoutes.emailFlow:
        return _buildRoute(const EmailFlowScreen(), settings);

      // -----------------------------------------------------------------------
      // Customer Account Routes
      // -----------------------------------------------------------------------
      case AppRoutes.customerProfile:
        return _buildRoute(const AccountProfileScreen(), settings);

      case AppRoutes.customerAddresses:
        return _buildRoute(const SavedAddressesScreen(), settings);

      case AppRoutes.customerAddAddress:
        final existing = settings.arguments as SavedAddress?;
        return _buildRoute(AddAddressScreen(existing: existing), settings);

      case AppRoutes.customerPaymentMethods:
        return _buildRoute(const PaymentMethodsScreen(), settings);

      case AppRoutes.customerAddPaymentMethod:
        return _buildRoute(const AddPaymentMethodScreen(), settings);

      case AppRoutes.customerLoyalty:
        return _buildRoute(const LoyaltyRewardsScreen(), settings);

      case AppRoutes.customerReferral:
        return _buildRoute(const ReferralScreen(), settings);

      // -----------------------------------------------------------------------
      // Screens in Development (Placeholder Scaffolds)
      // -----------------------------------------------------------------------
      case AppRoutes.customerHome:
        return _buildRoute(
          const _DevPlaceholderScreen(
            title: 'Customer Home',
            routeName: AppRoutes.customerHome,
            assignedTo: 'Ly Mengleang',
          ),
          settings,
        );

      case AppRoutes.customerRestaurantDetail:
        return _buildRoute(
          const _DevPlaceholderScreen(
            title: 'Restaurant Menu',
            routeName: AppRoutes.customerRestaurantDetail,
            assignedTo: 'Ly Mengleang',
          ),
          settings,
        );

      case AppRoutes.customerCart:
        return _buildRoute(
          const _DevPlaceholderScreen(
            title: 'Cart & Basket',
            routeName: AppRoutes.customerCart,
            assignedTo: 'Loeng Lin',
          ),
          settings,
        );

      case AppRoutes.customerCheckout:
        return _buildRoute(
          const _DevPlaceholderScreen(
            title: 'Checkout & Payment',
            routeName: AppRoutes.customerCheckout,
            assignedTo: 'Loeng Lin',
          ),
          settings,
        );

      case AppRoutes.customerOrders:
        return _buildRoute(
          const _DevPlaceholderScreen(
            title: 'Customer Orders',
            routeName: AppRoutes.customerOrders,
            assignedTo: 'Ly Mengleang',
          ),
          settings,
        );

      case AppRoutes.customerFavorites:
        return _buildRoute(
          const _DevPlaceholderScreen(
            title: 'Saved Favorites',
            routeName: AppRoutes.customerFavorites,
            assignedTo: 'Chan Veasna',
          ),
          settings,
        );

      case AppRoutes.driverDashboard:
        return _buildRoute(
          const _DevPlaceholderScreen(
            title: 'Driver Dashboard',
            routeName: AppRoutes.driverDashboard,
            assignedTo: 'Chan Veasna',
          ),
          settings,
        );

      case AppRoutes.restaurantDashboard:
        return _buildRoute(
          const _DevPlaceholderScreen(
            title: 'Restaurant Dashboard',
            routeName: AppRoutes.restaurantDashboard,
            assignedTo: 'Lem Senghor',
          ),
          settings,
        );

      case AppRoutes.adminDashboard:
        return _buildRoute(
          const _DevPlaceholderScreen(
            title: 'Admin Dashboard',
            routeName: AppRoutes.adminDashboard,
            assignedTo: 'Admin Platform Team',
          ),
          settings,
        );

      default:
        return _buildRoute(
          _NotFoundScreen(routeName: settings.name ?? 'unknown'),
          settings,
        );
    }
  }

  static MaterialPageRoute<dynamic> _buildRoute(
    Widget child,
    RouteSettings settings,
  ) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => child,
      settings: settings,
    );
  }
}

/// Fallback placeholder screen for features currently under team development.
class _DevPlaceholderScreen extends StatelessWidget {
  final String title;
  final String routeName;
  final String assignedTo;

  const _DevPlaceholderScreen({
    required this.title,
    required this.routeName,
    required this.assignedTo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(title, style: AppTextStyles.titleMedium),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.construction_outlined,
                  size: 48,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: AppSizes.paddingLarge),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Route: $routeName',
                style: AppTextStyles.caption.copyWith(fontFamily: 'monospace'),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSizes.badgeRadius),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  'Assigned to: $assignedTo',
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 404 Route Not Found View.
class _NotFoundScreen extends StatelessWidget {
  final String routeName;

  const _NotFoundScreen({required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: AppColors.error),
              const SizedBox(height: AppSizes.paddingMedium),
              Text('404 — Route Not Found', style: AppTextStyles.titleLarge),
              const SizedBox(height: 8),
              Text('No route registered for: $routeName', style: AppTextStyles.subtitle),
            ],
          ),
        ),
      ),
    );
  }
}
