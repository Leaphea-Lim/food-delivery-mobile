import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/shared_widgets.dart';
import '../../models/saved_address_model.dart';

/// Add/Edit address ជាមួយ Map placeholder
class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key, this.existing});

  final SavedAddress? existing;

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _labelCtrl;
  late final TextEditingController _addressCtrl;
  late final TextEditingController _noteCtrl;
  late bool _isDefault;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _labelCtrl = TextEditingController(text: e?.label ?? '');
    _addressCtrl = TextEditingController(text: e?.addressLine ?? '');
    _noteCtrl = TextEditingController(text: e?.note ?? '');
    _isDefault = e?.isDefault ?? false;
  }

  @override
  void dispose() {
    _labelCtrl.dispose();
    _addressCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.pop(
      context,
      SavedAddress(
        id: widget.existing?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        label: _labelCtrl.text.trim(),
        addressLine: _addressCtrl.text.trim(),
        note: _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim(),
        isDefault: _isDefault,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final editing = widget.existing != null;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: CustomAppBar(title: editing ? 'Edit Address' : 'Add Address'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Map placeholder
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(
                          Icons.map_outlined,
                          size: 96,
                          color: AppColors.primary.withValues(alpha: 0.2),
                        ),
                      ),
                      const Center(
                        child: Icon(Icons.location_on,
                            size: 44, color: AppColors.error),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 10,
                        child: Center(
                          child: Text('Map placeholder',
                              style: AppTextStyles.caption),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Label',
                  hintText: 'Home, Work, Other',
                  controller: _labelCtrl,
                  prefixIcon: const Icon(Icons.label_outline,
                      color: AppColors.textSecondary),
                  validator: (v) =>
                      Validators.validateRequired(v, fieldName: 'Label'),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Address',
                  hintText: 'House no., street, district',
                  controller: _addressCtrl,
                  maxLines: 2,
                  prefixIcon: const Icon(Icons.place_outlined,
                      color: AppColors.textSecondary),
                  validator: (v) =>
                      Validators.validateRequired(v, fieldName: 'Address'),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Delivery note (optional)',
                  hintText: 'Gate color, landmark...',
                  controller: _noteCtrl,
                  prefixIcon: const Icon(Icons.sticky_note_2_outlined,
                      color: AppColors.textSecondary),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Switch(
                      value: _isDefault,
                      activeThumbColor: AppColors.secondary,
                      onChanged: (v) => setState(() => _isDefault = v),
                    ),
                    const SizedBox(width: 8),
                    Text('Set as default address', style: AppTextStyles.body),
                  ],
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  text: editing ? 'Save Changes' : 'Save Address',
                  onPressed: _save,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
