import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/shared_widgets.dart';
import '../../../auth/models/user_model.dart';
import '../../../auth/screens/auth_landing_screen.dart';
import '../../widgets/account_widgets.dart';
import 'loyalty_rewards_screen.dart';
import 'payment_methods_screen.dart';
import 'referral_screen.dart';
import 'saved_addresses_screen.dart';

/// Profile និង Account Settings
class AccountProfileScreen extends StatefulWidget {
  const AccountProfileScreen({super.key});

  @override
  State<AccountProfileScreen> createState() => _AccountProfileScreenState();
}

class _AccountProfileScreenState extends State<AccountProfileScreen> {
  String _name = MockData.user.name;
  String _phone = MockData.user.phone ?? '';
  String _email = MockData.user.email;

  String _language = 'English';
  bool _notifications = true;

  void _push(Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  Future<void> _editProfile() async {
    final result = await showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _EditProfileSheet(name: _name, phone: _phone, email: _email),
    );
    if (result != null) {
      setState(() {
        _name = result[0];
        _phone = result[1];
        _email = result[2];
      });
    }
  }

  Future<void> _chooseLanguage() async {
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Language'),
        children: [
          for (final lang in const ['English', 'ភាសាខ្មែរ'])
            SimpleDialogOption(
              onPressed: () => Navigator.pop(ctx, lang),
              child: Row(
                children: [
                  Expanded(child: Text(lang)),
                  if (lang == _language)
                    const Icon(Icons.check, color: AppColors.primary),
                ],
              ),
            ),
        ],
      ),
    );
    if (result != null) setState(() => _language = result);
  }

  void _confirmLogout() {
    showDialog<void>(
      context: context,
      builder: (ctx) => CustomDialog(
        title: 'Log out',
        message: 'Are you sure you want to log out?',
        confirmText: 'Log out',
        isDestructive: true,
        onConfirm: () {
          Navigator.of(ctx).pop();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const AuthLandingScreen()),
            (route) => false,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final initial = _name.isNotEmpty ? _name[0].toUpperCase() : '?';

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CustomAppBar(title: 'Profile'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
          children: [
            AccountCard(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 88,
                        height: 88,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryLight,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          initial,
                          style: AppTextStyles.heading.copyWith(fontSize: 36),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt,
                              size: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(_name, style: AppTextStyles.titleLarge),
                  const SizedBox(height: 4),
                  Text(_phone, style: AppTextStyles.subtitle),
                  Text(_email, style: AppTextStyles.subtitle),
                  const SizedBox(height: 16),
                  AppOutlineButton(
                    text: 'EDIT PROFILE',
                    height: AppSizes.buttonHeightSmall,
                    icon: const Icon(Icons.edit_outlined,
                        size: 18, color: AppColors.primary),
                    onPressed: _editProfile,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            AccountCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  AccountTile(
                    icon: Icons.location_on_outlined,
                    title: 'Saved addresses',
                    onTap: () => _push(const SavedAddressesScreen()),
                  ),
                  const Divider(),
                  AccountTile(
                    icon: Icons.credit_card,
                    title: 'Payment methods',
                    onTap: () => _push(const PaymentMethodsScreen()),
                  ),
                  const Divider(),
                  AccountTile(
                    icon: Icons.stars_outlined,
                    title: 'Loyalty & Rewards',
                    onTap: () => _push(const LoyaltyRewardsScreen()),
                  ),
                  const Divider(),
                  AccountTile(
                    icon: Icons.card_giftcard,
                    title: 'Referral program',
                    onTap: () => _push(const ReferralScreen()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            AccountCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  AccountTile(
                    icon: Icons.language,
                    title: 'Language',
                    subtitle: _language,
                    onTap: _chooseLanguage,
                  ),
                  const Divider(),
                  AccountTile(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    trailing: Switch(
                      value: _notifications,
                      activeThumbColor: AppColors.secondary,
                      onChanged: (v) => setState(() => _notifications = v),
                    ),
                    onTap: () =>
                        setState(() => _notifications = !_notifications),
                  ),
                  const Divider(),
                  AccountTile(
                    icon: Icons.logout,
                    title: 'Log out',
                    color: AppColors.error,
                    trailing: const SizedBox.shrink(),
                    onTap: _confirmLogout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditProfileSheet extends StatefulWidget {
  const _EditProfileSheet({
    required this.name,
    required this.phone,
    required this.email,
  });

  final String name;
  final String phone;
  final String email;

  @override
  State<_EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<_EditProfileSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _emailCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.name);
    _phoneCtrl = TextEditingController(text: widget.phone);
    _emailCtrl = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, [
        _nameCtrl.text.trim(),
        _phoneCtrl.text.trim(),
        _emailCtrl.text.trim(),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSizes.screenHorizontalPadding,
        AppSizes.paddingLarge,
        AppSizes.screenHorizontalPadding,
        MediaQuery.of(context).viewInsets.bottom + AppSizes.paddingLarge,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Edit Profile', style: AppTextStyles.titleLarge),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Full Name',
                controller: _nameCtrl,
                validator: (v) =>
                    Validators.validateRequired(v, fieldName: 'Name'),
              ),
              const SizedBox(height: 12),
              CustomTextField(
                label: 'Phone number',
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                validator: Validators.validatePhone,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                label: 'Email',
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 20),
              PrimaryButton(text: 'Save', onPressed: _save),
            ],
          ),
        ),
      ),
    );
  }
}
