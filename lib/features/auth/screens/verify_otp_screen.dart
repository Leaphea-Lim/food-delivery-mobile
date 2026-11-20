import 'dart:async';

import 'package:material_ui/material_ui.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../shared/shared_widgets.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_palette.dart';
import '../widgets/otp_input.dart';
import 'home_placeholder_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email, this.nextBuilder});

  /// Email ឬលេខទូរស័ព្ទដែលបានផ្ញើកូដទៅ
  final String email;

  /// Screen បន្ទាប់ក្រោយ Confirm (ឧ. Register, Reset Password)។ បើគ្មាន → Home
  final WidgetBuilder? nextBuilder;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  static const int _codeLength = 4;
  static const int _seconds = 60;

  int _remaining = _seconds;
  Timer? _timer;
  String _code = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _remaining = _seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining <= 1) timer.cancel();
      setState(() => _remaining = _remaining > 0 ? _remaining - 1 : 0);
    });
  }

  void _resend() {
    setState(_startTimer);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification code resent (UI only)')),
    );
  }

  void _confirm() {
    if (_code.length != _codeLength) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the 4-digit code')),
      );
      return;
    }
    final next = widget.nextBuilder;
    if (next != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: next));
      return;
    }
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomePlaceholderScreen()),
      (route) => false,
    );
  }

  String get _timeText => '00:${_remaining.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final canResend = _remaining == 0;

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
                  'Verification Code',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading.copyWith(fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'We have sent the verification code to ${widget.email}',
                style: AppTextStyles.subtitle.copyWith(
                  fontSize: 16,
                  color: AppColors.textMuted,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please check your message.',
                style: AppTextStyles.subtitle.copyWith(
                  fontSize: 16,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 24),
              OtpInput(
                length: _codeLength,
                onChanged: (value) => _code = value,
              ),
              const SizedBox(height: 36),
              PrimaryButton(text: 'Confirm', onPressed: _confirm),
              const SizedBox(height: 20),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'if you did not receive your verification, ',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 13,
                      color: AppColors.secondaryHover,
                    ),
                  ),
                  GestureDetector(
                    onTap: canResend ? _resend : null,
                    child: Text(
                      canResend ? 'RESEND' : 'RESEND ($_timeText)',
                      style: AppTextStyles.caption.copyWith(
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                        color: canResend
                            ? AppColors.secondaryHover
                            : AppColors.textMuted,
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
