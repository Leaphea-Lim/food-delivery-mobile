import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/shared_widgets.dart';
import '../../models/payment_method_model.dart';

/// ទម្រង់បន្ថែមវិធីបង់ប្រាក់ថ្មី (Static UI — មិនរក្សាលេខកាតពេញ)
class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  final _formKey = GlobalKey<FormState>();
  final _holderCtrl = TextEditingController();
  final _numberCtrl = TextEditingController();
  final _expiryCtrl = TextEditingController();
  final _cvvCtrl = TextEditingController();
  final _walletCtrl = TextEditingController();

  PaymentType _type = PaymentType.card;
  bool _isDefault = false;

  static const _labels = {
    PaymentType.card: 'Card',
    PaymentType.abaPay: 'ABA Pay',
    PaymentType.wing: 'Wing',
    PaymentType.cash: 'Cash',
  };

  @override
  void dispose() {
    _holderCtrl.dispose();
    _numberCtrl.dispose();
    _expiryCtrl.dispose();
    _cvvCtrl.dispose();
    _walletCtrl.dispose();
    super.dispose();
  }

  String? _validateCardNumber(String? v) {
    final digits = (v ?? '').replaceAll(' ', '');
    if (digits.isEmpty) return 'Card number is required';
    if (!RegExp(r'^\d{16}$').hasMatch(digits)) {
      return 'Card number must be 16 digits';
    }
    return null;
  }

  String? _validateExpiry(String? v) {
    final text = (v ?? '').trim();
    if (text.isEmpty) return 'Expiry is required';
    if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(text)) {
      return 'Use MM/YY';
    }
    return null;
  }

  String? _validateCvv(String? v) {
    final text = (v ?? '').trim();
    if (text.isEmpty) return 'CVV is required';
    if (!RegExp(r'^\d{3,4}$').hasMatch(text)) return '3-4 digits';
    return null;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    late final String title;
    late final String detail;
    switch (_type) {
      case PaymentType.card:
        final digits = _numberCtrl.text.replaceAll(' ', '');
        title = 'Credit/Debit Card';
        detail = '•••• ${digits.substring(digits.length - 4)}';
        break;
      case PaymentType.abaPay:
        title = 'ABA Pay';
        detail = _walletCtrl.text.trim();
        break;
      case PaymentType.wing:
        title = 'Wing';
        detail = _walletCtrl.text.trim();
        break;
      case PaymentType.cash:
        title = 'Cash on Delivery';
        detail = 'Pay when you receive';
        break;
    }

    Navigator.pop(
      context,
      PaymentMethod(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: _type,
        title: title,
        detail: detail,
        isDefault: _isDefault,
      ),
    );
  }

  Widget _fields() {
    switch (_type) {
      case PaymentType.card:
        return Column(
          children: [
            CustomTextField(
              label: 'Card Holder Name',
              hintText: 'MAYA CHAN',
              controller: _holderCtrl,
              prefixIcon: const Icon(Icons.person_outline,
                  color: AppColors.textSecondary),
              validator: (v) =>
                  Validators.validateRequired(v, fieldName: 'Card holder name'),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Card Number',
              hintText: '1234 5678 9012 3456',
              controller: _numberCtrl,
              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.credit_card,
                  color: AppColors.textSecondary),
              validator: _validateCardNumber,
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'Expiry',
                    hintText: 'MM/YY',
                    controller: _expiryCtrl,
                    keyboardType: TextInputType.datetime,
                    validator: _validateExpiry,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    label: 'CVV',
                    hintText: '123',
                    controller: _cvvCtrl,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: _validateCvv,
                  ),
                ),
              ],
            ),
          ],
        );
      case PaymentType.abaPay:
      case PaymentType.wing:
        return CustomTextField(
          label: '${_labels[_type]} Account Phone Number',
          hintText: '012 345 678',
          controller: _walletCtrl,
          keyboardType: TextInputType.phone,
          prefixIcon:
              const Icon(Icons.phone_outlined, color: AppColors.textSecondary),
          validator: Validators.validatePhone,
        );
      case PaymentType.cash:
        return Text(
          'You will pay in cash to the driver when your order arrives.',
          style: AppTextStyles.subtitle,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CustomAppBar(title: 'Add Payment Method'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Type', style: AppTextStyles.titleMedium),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: [
                    for (final t in PaymentType.values)
                      ChoiceChip(
                        label: Text(_labels[t]!),
                        selected: _type == t,
                        selectedColor: AppColors.primaryLight,
                        onSelected: (_) => setState(() => _type = t),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                AccountFormCard(child: _fields()),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Switch(
                      value: _isDefault,
                      activeColor: AppColors.secondary,
                      onChanged: (v) => setState(() => _isDefault = v),
                    ),
                    const SizedBox(width: 8),
                    Text('Set as default', style: AppTextStyles.body),
                  ],
                ),
                const SizedBox(height: 20),
                PrimaryButton(text: 'Save', onPressed: _save),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ប្រអប់ស សម្រាប់ទម្រង់
class AccountFormCard extends StatelessWidget {
  const AccountFormCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }
}
