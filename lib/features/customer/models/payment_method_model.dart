enum PaymentType { card, abaPay, wing, cash }

/// វិធីបង់ប្រាក់ដែលបានរក្សាទុក (រក្សាតែលេខ ៤ ខ្ទង់ចុងក្រោយ មិនរក្សាលេខកាតពេញ)
class PaymentMethod {
  const PaymentMethod({
    required this.id,
    required this.type,
    required this.title,
    required this.detail,
    this.isDefault = false,
  });

  final String id;
  final PaymentType type;
  final String title;
  final String detail; // ឧ. •••• 4242 ឬ លេខទូរស័ព្ទ

  final bool isDefault;

  PaymentMethod copyWith({bool? isDefault}) {
    return PaymentMethod(
      id: id,
      type: type,
      title: title,
      detail: detail,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
