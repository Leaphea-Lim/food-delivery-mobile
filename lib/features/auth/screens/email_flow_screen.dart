import 'package:material_ui/material_ui.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../shared/shared_widgets.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_palette.dart';
import '../widgets/auth_tab_switch.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'verify_otp_screen.dart';

/// Tab "New User" — បញ្ចូល Email ដើម្បីទទួលកូដ Verification
class EmailFlowScreen extends StatefulWidget {
  const EmailFlowScreen({super.key});

  @override
  State<EmailFlowScreen> createState() => _EmailFlowScreenState();
}

class _EmailFlowScreenState extends State<EmailFlowScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  void _continue() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => VerifyOtpScreen(
            email: _emailCtrl.text.trim(),
            // ក្រោយបញ្ជាក់កូដ → បំពេញព័ត៌មាន Register
            nextBuilder: (_) =>
                RegisterScreen(verifiedContact: _emailCtrl.text.trim()),
          ),
        ),
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
                  'Get your Verification Code',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading.copyWith(fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              AuthTabSwitch(
                labels: const ['User', 'New User'],
                icons: const [Icons.login, Icons.person_add_alt_1_outlined],
                selectedIndex: 1,
                onChanged: (i) {
                  if (i == 0) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
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
                  child: CustomTextField(
                    label: 'Email Address',
                    hintText: 'maya@example.com',
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.mail_outline,
                        color: AppColors.textSecondary),
                    validator: Validators.validateEmail,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(text: 'Continue', onPressed: _continue),
            ],
          ),
        ),
      ),
    );
  }
}
