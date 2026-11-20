import '../../../core/utils/validators.dart';

/// Validation ដែលក្រុមមិនទាន់មាន (Name, Phone/Email, Confirm password)
/// ពឹងលើ Validators របស់ក្រុម។ ប្រសិនបើ Lead ចង់ អាចផ្លាស់ចូល core/utils/validators.dart ពេលក្រោយ
class AuthValidators {
  AuthValidators._();

  static String? validateName(String? value) =>
      Validators.validateRequired(value, fieldName: 'Name');

  /// ទទួលយក Email ឬ លេខទូរស័ព្ទ
  static String? validateIdentifier(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number or email is required';
    }
    final text = value.trim();
    return text.contains('@')
        ? Validators.validateEmail(text)
        : Validators.validatePhone(text);
  }

  /// ប្រើ៖ validator: AuthValidators.validateConfirmPassword(() => _passCtrl.text)
  static String? Function(String?) validateConfirmPassword(
    String Function() original,
  ) {
    return (String? value) {
      if (value == null || value.isEmpty) return 'Please confirm your password';
      if (value != original()) return 'Passwords do not match';
      return null;
    };
  }
}
