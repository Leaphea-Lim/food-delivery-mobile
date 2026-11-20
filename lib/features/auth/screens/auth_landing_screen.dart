import 'package:material_ui/material_ui.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_palette.dart';
import '../widgets/auth_tab_switch.dart';
import '../widgets/social_button.dart';
import 'email_flow_screen.dart';
import 'login_screen.dart';

/// Screen "Auth Login" ក្នុង Figma៖ ជ្រើសវិធី Sign In / Register
class AuthLandingScreen extends StatefulWidget {
  const AuthLandingScreen({super.key});

  @override
  State<AuthLandingScreen> createState() => _AuthLandingScreenState();
}

class _AuthLandingScreenState extends State<AuthLandingScreen> {
  int _tab = 0; // 0 = Sign In, 1 = Register

  void _snack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _continueWithEmail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            _tab == 0 ? const LoginScreen() : const EmailFlowScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const link = TextStyle(
      color: AppColors.secondaryHover,
      decoration: TextDecoration.underline,
    );

    return Scaffold(
      backgroundColor: AuthPalette.pageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSizes.screenHorizontalPadding,
            AppSizes.paddingXLarge,
            AppSizes.screenHorizontalPadding,
            AppSizes.paddingLarge,
          ),
          child: Column(
            children: [
              const AuthLogo(size: 150),
              const SizedBox(height: 24),
              Text(
                'Welcome to\nSmart Food\nDelivery System',
                textAlign: TextAlign.center,
                style: AppTextStyles.heading.copyWith(fontSize: 28, height: 1.25),
              ),
              const SizedBox(height: 28),
              AuthTabSwitch(
                labels: const ['Sign In', 'Register'],
                icons: const [Icons.login, Icons.person_add_alt_1_outlined],
                selectedIndex: _tab,
                onChanged: (i) => setState(() => _tab = i),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(AppSizes.paddingMedium),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    SocialButton(
                      label: 'Continue with Google',
                      icon: const Icon(Icons.g_mobiledata,
                          size: 32, color: Colors.redAccent),
                      onTap: () => _snack('Google sign-in (UI only)'),
                    ),
                    const SizedBox(height: 12),
                    // Figma មាន "Continue with Google" ពីរដង — ប្រើ Email ជំនួស (សួរ Lead)
                    SocialButton(
                      label: 'Continue with Email',
                      icon: const Icon(Icons.mail_outline,
                          color: AppColors.primary),
                      onTap: _continueWithEmail,
                    ),
                    const SizedBox(height: 12),
                    SocialButton(
                      label: 'Phone number',
                      icon: const Icon(Icons.phone, color: AppColors.secondary),
                      onTap: () => _snack('Phone sign-in (UI only)'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 12, color: AppColors.textPrimary),
                  children: [
                    TextSpan(text: 'By continuing, you agree to our '),
                    TextSpan(text: 'Terms and Conditions', style: link),
                    TextSpan(text: ' and '),
                    TextSpan(text: 'Privacy Policy', style: link),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
