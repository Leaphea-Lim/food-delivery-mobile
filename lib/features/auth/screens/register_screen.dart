import 'package:material_ui/material_ui.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../shared/shared_widgets.dart';
import '../utils/auth_validators.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_palette.dart';
import 'home_placeholder_screen.dart';
import 'login_screen.dart';

/// Register៖ ឈ្មោះ, ទូរស័ព្ទ/email, password, confirm password, checkbox លក្ខខណ្ឌ
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, this.verifiedContact});

  /// Email/ទូរស័ព្ទដែលបានបញ្ជាក់ OTP រួច (បើមាន នឹងបិទមិនឲ្យកែ)
  final String? verifiedContact;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  late final TextEditingController _contactCtrl;
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _agreed = false;
  bool _showTermsError = false;

  @override
  void initState() {
    super.initState();
    _contactCtrl = TextEditingController(text: widget.verifiedContact ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _contactCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final valid = _formKey.currentState!.validate();
    setState(() => _showTermsError = !_agreed);
    if (valid && _agreed) {
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
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Create your account',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading.copyWith(fontSize: 24),
                ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        label: 'Full Name',
                        hintText: 'Maya Chan',
                        controller: _nameCtrl,
                        prefixIcon: const Icon(Icons.person_outline,
                            color: AppColors.textSecondary),
                        validator: AuthValidators.validateName,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'Phone number or Email',
                        hintText: 'maya@example.com',
                        controller: _contactCtrl,
                        readOnly: widget.verifiedContact != null,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.mail_outline,
                            color: AppColors.textSecondary),
                        validator: AuthValidators.validateIdentifier,
                      ),
                      const SizedBox(height: 16),
                      PasswordTextField(
                        label: 'Password',
                        controller: _passwordCtrl,
                        validator: Validators.validatePassword,
                      ),
                      const SizedBox(height: 16),
                      PasswordTextField(
                        label: 'Confirm Password',
                        hintText: 'Re-enter your password',
                        controller: _confirmCtrl,
                        validator: AuthValidators.validateConfirmPassword(
                          () => _passwordCtrl.text,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Checkbox(
                            value: _agreed,
                            activeColor: AppColors.primary,
                            onChanged: (v) => setState(() {
                              _agreed = v ?? false;
                              if (_agreed) _showTermsError = false;
                            }),
                          ),
                          const Expanded(
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(fontSize: 13),
                                children: [
                                  TextSpan(text: 'I agree to the '),
                                  TextSpan(
                                    text: 'Terms and Conditions',
                                    style: TextStyle(
                                      color: AppColors.secondaryHover,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_showTermsError)
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'You must accept the terms to continue',
                            style: TextStyle(
                              color: AppColors.error,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(text: 'Register', onPressed: _submit),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?', style: AppTextStyles.body),
                  TextButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
