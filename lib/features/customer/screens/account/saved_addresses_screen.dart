import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../shared/shared_widgets.dart';
import '../../models/customer_mock_data.dart';
import '../../models/saved_address_model.dart';
import '../../widgets/account_widgets.dart';
import 'add_address_screen.dart';

/// បញ្ជីអាសយដ្ឋានដែលមាន Edit និង Delete
class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({super.key});

  @override
  State<SavedAddressesScreen> createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
  late List<SavedAddress> _addresses;

  @override
  void initState() {
    super.initState();
    _addresses = List.of(CustomerMockData.addresses);
  }

  IconData _iconFor(String label) {
    switch (label.toLowerCase()) {
      case 'home':
        return Icons.home_outlined;
      case 'work':
        return Icons.work_outline;
      default:
        return Icons.place_outlined;
    }
  }

  Future<void> _openForm({SavedAddress? existing}) async {
    final result = await Navigator.of(context).push<SavedAddress>(
      MaterialPageRoute(builder: (_) => AddAddressScreen(existing: existing)),
    );
    if (result == null) return;
    setState(() {
      var list = _addresses.map((a) {
        // មានតែ Default មួយប៉ុណ្ណោះ
        return result.isDefault && a.id != result.id
            ? a.copyWith(isDefault: false)
            : a;
      }).toList();
      final index = list.indexWhere((a) => a.id == result.id);
      if (index >= 0) {
        list[index] = result;
      } else {
        list = [...list, result];
      }
      _addresses = list;
    });
  }

  void _confirmDelete(SavedAddress address) {
    showDialog<void>(
      context: context,
      builder: (ctx) => CustomDialog(
        title: 'Delete address',
        message: 'Delete "${address.label}" from your saved addresses?',
        confirmText: 'Delete',
        isDestructive: true,
        onConfirm: () {
          Navigator.of(ctx).pop();
          setState(() => _addresses.removeWhere((a) => a.id == address.id));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CustomAppBar(title: 'Saved Addresses'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _addresses.isEmpty
                  ? const EmptyStateView(
                      icon: Icons.location_off_outlined,
                      title: 'No saved addresses',
                      description: 'Add an address to make checkout faster.',
                    )
                  : ListView.separated(
                      padding:
                          const EdgeInsets.all(AppSizes.screenHorizontalPadding),
                      itemCount: _addresses.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (_, i) {
                        final a = _addresses[i];
                        return AccountCard(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(_iconFor(a.label), color: AppColors.primary),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(a.label,
                                            style: AppTextStyles.titleMedium),
                                        if (a.isDefault) ...[
                                          const SizedBox(width: 8),
                                          const DefaultBadge(),
                                        ],
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(a.addressLine,
                                        style: AppTextStyles.subtitle),
                                    if (a.note != null && a.note!.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(a.note!,
                                            style: AppTextStyles.caption),
                                      ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit_outlined),
                                color: AppColors.textSecondary,
                                onPressed: () => _openForm(existing: a),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline),
                                color: AppColors.error,
                                onPressed: () => _confirmDelete(a),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
              child: PrimaryButton(
                text: 'Add Address',
                icon: const Icon(Icons.add, color: AppColors.secondary),
                onPressed: () => _openForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
