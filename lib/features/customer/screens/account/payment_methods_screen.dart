import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../shared/shared_widgets.dart';
import '../../models/customer_mock_data.dart';
import '../../models/payment_method_model.dart';
import '../../widgets/account_widgets.dart';
import 'add_payment_method_screen.dart';

/// បញ្ជីវិធីបង់ប្រាក់ដែលបានរក្សាទុក
class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  late List<PaymentMethod> _methods;

  @override
  void initState() {
    super.initState();
    _methods = List.of(CustomerMockData.paymentMethods);
  }

  IconData _iconFor(PaymentType type) {
    switch (type) {
      case PaymentType.card:
        return Icons.credit_card;
      case PaymentType.abaPay:
      case PaymentType.wing:
        return Icons.account_balance_wallet_outlined;
      case PaymentType.cash:
        return Icons.payments_outlined;
    }
  }

  void _setDefault(PaymentMethod method) {
    setState(() {
      _methods = _methods
          .map((m) => m.copyWith(isDefault: m.id == method.id))
          .toList();
    });
  }

  Future<void> _add() async {
    final result = await Navigator.of(context).push<PaymentMethod>(
      MaterialPageRoute(builder: (_) => const AddPaymentMethodScreen()),
    );
    if (result == null) return;
    setState(() {
      final list = result.isDefault
          ? _methods.map((m) => m.copyWith(isDefault: false)).toList()
          : List.of(_methods);
      _methods = [...list, result];
    });
  }

  void _confirmDelete(PaymentMethod method) {
    showDialog<void>(
      context: context,
      builder: (ctx) => CustomDialog(
        title: 'Remove payment method',
        message: 'Remove ${method.title} (${method.detail})?',
        confirmText: 'Remove',
        isDestructive: true,
        onConfirm: () {
          Navigator.of(ctx).pop();
          setState(() => _methods.removeWhere((m) => m.id == method.id));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CustomAppBar(title: 'Payment Methods'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _methods.isEmpty
                  ? const EmptyStateView(
                      icon: Icons.credit_card_off_outlined,
                      title: 'No payment methods',
                      description: 'Add a payment method to pay faster.',
                    )
                  : ListView.separated(
                      padding:
                          const EdgeInsets.all(AppSizes.screenHorizontalPadding),
                      itemCount: _methods.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (_, i) {
                        final m = _methods[i];
                        return InkWell(
                          borderRadius:
                              BorderRadius.circular(AppSizes.cardRadius),
                          onTap: () => _setDefault(m),
                          child: AccountCard(
                            child: Row(
                              children: [
                                Icon(_iconFor(m.type),
                                    color: AppColors.primary, size: 28),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(m.title,
                                                style:
                                                    AppTextStyles.titleMedium),
                                          ),
                                          if (m.isDefault) ...[
                                            const SizedBox(width: 8),
                                            const DefaultBadge(),
                                          ],
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(m.detail,
                                          style: AppTextStyles.subtitle),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  color: AppColors.error,
                                  onPressed: () => _confirmDelete(m),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
              child: PrimaryButton(
                text: 'Add Payment Method',
                icon: const Icon(Icons.add, color: AppColors.secondary),
                onPressed: _add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
