import 'loyalty_model.dart';
import 'payment_method_model.dart';
import 'saved_address_model.dart';

/// Mock Data សម្រាប់ Static UI (ជំនួសដោយ API ពេលក្រោយ)
class CustomerMockData {
  CustomerMockData._();

  static const String referralCode = 'MAYA2026';

  static const List<SavedAddress> addresses = [
    SavedAddress(
      id: 'a1',
      label: 'Home',
      addressLine: '#12, Street 271, Toul Kork, Phnom Penh',
      note: 'Blue gate, ring the bell',
      isDefault: true,
    ),
    SavedAddress(
      id: 'a2',
      label: 'Work',
      addressLine: 'Royal University of Phnom Penh, Russian Blvd',
    ),
  ];

  static const List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      id: 'p1',
      type: PaymentType.card,
      title: 'Credit/Debit Card',
      detail: '•••• 4242',
      isDefault: true,
    ),
    PaymentMethod(
      id: 'p2',
      type: PaymentType.abaPay,
      title: 'ABA Pay',
      detail: '012 345 678',
    ),
    PaymentMethod(
      id: 'p3',
      type: PaymentType.cash,
      title: 'Cash on Delivery',
      detail: 'Pay when you receive',
    ),
  ];

  static const int startingPoints = 780;

  static const List<PointTransaction> pointHistory = [
    PointTransaction(
        id: 't1', description: 'Order #1042', points: 120, date: 'Nov 18, 2026'),
    PointTransaction(
        id: 't2', description: 'Redeemed: Free delivery', points: -200, date: 'Nov 12, 2026'),
    PointTransaction(
        id: 't3', description: 'Referral bonus', points: 100, date: 'Nov 08, 2026'),
    PointTransaction(
        id: 't4', description: 'Order #1019', points: 90, date: 'Nov 02, 2026'),
  ];

  static const List<Reward> rewards = [
    Reward(id: 'r1', title: 'Free delivery', pointsCost: 200),
    Reward(id: 'r2', title: r'$2 off your order', pointsCost: 300),
    Reward(id: 'r3', title: 'Free drink', pointsCost: 500),
  ];
}
