import 'package:material_ui/material_ui.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../shared/shared_widgets.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_palette.dart';
import '../widgets/auth_tab_switch.dart';
import 'email_flow_screen.dart';
import '../utils/auth_validators.dart';
import 'forgot_password_screen.dart';
import 'home_placeholder_screen.dart';

/// Tab "User" — Login ដោយ Email + Password
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const HomePlaceholderScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthPalette.pageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthLogo(size: 90),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Input your email account\nand password',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading.copyWith(fontSize: 24, height: 1.3),
                ),
              ),
              const SizedBox(height: 20),
              AuthTabSwitch(
                labels: const ['User', 'New User'],
                icons: const [Icons.login, Icons.person_add_alt_1_outlined],
                selectedIndex: 0,
                onChanged: (i) {
                  if (i == 1) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (_) => const EmailFlowScreen()),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Email or Phone number',
                        hintText: 'maya@example.com',
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.person_outline,
                            color: AppColors.textSecondary),
                        validator: AuthValidators.validateIdentifier,
                      ),
                      const SizedBox(height: 16),
                      // Figma ដាក់ label ខុស ("Email Address") — កែជា "Password"
                      PasswordTextField(
                        label: 'Password',
                        controller: _passwordCtrl,
                        validator: Validators.validatePassword,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ForgotPasswordScreen(),
                            ),
                          ),
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(text: 'Login', onPressed: _submit),
            ],
          ),
        ),
      ),
    );
  }
}
