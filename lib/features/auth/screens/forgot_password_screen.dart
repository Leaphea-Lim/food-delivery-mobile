import 'package:material_ui/material_ui.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../shared/shared_widgets.dart';
import '../utils/auth_validators.dart';
import '../widgets/auth_palette.dart';
import 'reset_password_screen.dart';
import 'verify_otp_screen.dart';

/// Forgot password ជំហាន ១៖ បញ្ចូលទូរស័ព្ទ/email ហើយផ្ញើកូដ
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _contactCtrl = TextEditingController();

  @override
  void dispose() {
    _contactCtrl.dispose();
    super.dispose();
  }

  void _sendCode() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => VerifyOtpScreen(
            email: _contactCtrl.text.trim(),
            nextBuilder: (_) => const ResetPasswordScreen(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthPalette.pageBackground,
      appBar: const CustomAppBar(title: 'Forgot Password'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your phone number or email and we will send you a verification code.',
                style: AppTextStyles.subtitle,
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: CustomTextField(
                    label: 'Phone number or Email',
                    hintText: 'maya@example.com',
                    controller: _contactCtrl,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.mail_outline,
                        color: AppColors.textSecondary),
                    validator: AuthValidators.validateIdentifier,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(text: 'Send Code', onPressed: _sendCode),
            ],
          ),
        ),
      ),
    );
  }
}
