# Auth + Account UI (Sorn Noeng) — Static UI ពេញលេញតាម Notion

## Flow
Welcome → Auth Landing → Login / Email Flow → OTP → Register → Home(placeholder) → Profile
- Login → Forgot Password → OTP → Reset Password → Login
- Home(placeholder) → Profile → Saved Addresses / Payment Methods / Loyalty & Rewards / Referral / Language / Notifications / Logout

## File ថ្មី (មិនជាន់ File ក្រុម ១ File ប៉ុណ្ណោះដែលកែ)
features/auth/
  screens/ register, forgot_password, reset_password (ថ្មី) + login, email_flow, verify_otp, auth_landing, home_placeholder
  utils/auth_validators.dart  (validateName, validateIdentifier, validateConfirmPassword)
  widgets/ auth_logo, auth_palette, auth_tab_switch, social_button, otp_input
  models/user_model.dart
features/customer/
  models/ saved_address, payment_method, loyalty, customer_mock_data
  widgets/account_widgets.dart
  screens/account/ account_profile, saved_addresses, add_address, payment_methods,
                   add_payment_method, loyalty_rewards, referral
main_auth_preview.dart

## File ក្រុមដែលកែ (Lead បាន Approve)
features/auth/screens/welcome_screen.dart — ភ្ជាប់ប៊ូតុង CONTINUE ទៅ AuthLandingScreen (កែតែ onPressed + import)

## ប្រើពីក្រុម
PrimaryButton, SecondaryButton, AppOutlineButton, CustomTextField, PasswordTextField,
CustomAppBar, CustomDialog, EmptyStateView, AppColors/AppSizes/AppTextStyles, Validators

## Push
git checkout -b feature/auth-ui
# Copy lib/ ចូល Repo (Welcome Screen នឹងជាន់ File ចាស់ — ពិនិត្យ git diff)
flutter run -t lib/main_auth_preview.dart
git add . && git commit -m "feat(auth): complete customer auth and account static UI" && git push origin feature/auth-ui

## សួរ Lead
- Validators ថ្មី (name/identifier/confirm) ដាក់ក្នុង core/utils/validators.dart បានទេ?
- Figma ថា Language ជា English/Khmer តែ Static UI នៅមិនទាន់ប្តូរភាសាពិត
- Google/Phone Login និង Share ជា UI only
