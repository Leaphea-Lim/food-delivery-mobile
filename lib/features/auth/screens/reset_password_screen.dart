import 'package:material_ui/material_ui.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../shared/shared_widgets.dart';
import '../utils/auth_validators.dart';
import '../widgets/auth_palette.dart';
import 'login_screen.dart';

/// Forgot password ជំហាន ២៖ កំណត់ Password ថ្មី (ក្រោយបញ្ជាក់ OTP)
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  @override
  void dispose() {
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password updated. Please login.')),
    );
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthPalette.pageBackground,
      appBar: const CustomAppBar(title: 'New Password', showBackButton: false),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create a new password for your account.',
                  style: AppTextStyles.subtitle),
              const SizedBox(height: 24),
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
                      PasswordTextField(
                        label: 'New Password',
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(text: 'Reset Password', onPressed: _submit),
            ],
          ),
        ),
      ),
    );
  }
}
