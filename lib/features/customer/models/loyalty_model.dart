/// ប្រវត្តិ Points (តារាង loyalty_transactions)
class PointTransaction {
  const PointTransaction({
    required this.id,
    required this.description,
    required this.points, // + ទទួលបាន, - ប្រើប្រាស់
    required this.date,
  });

  final String id;
  final String description;
  final int points;
  final String date;
}

/// រង្វាន់ដែលអាច Redeem (តារាង rewards)
class Reward {
  const Reward({
    required this.id,
    required this.title,
    required this.pointsCost,
  });

  final String id;
  final String title;
  final int pointsCost;
}

/// Tier តាមចំនួន Points
class LoyaltyTier {
  const LoyaltyTier(this.name, this.minPoints);

  final String name;
  final int minPoints;

  static const List<LoyaltyTier> all = [
    LoyaltyTier('Bronze', 0),
    LoyaltyTier('Silver', 500),
    LoyaltyTier('Gold', 1000),
    LoyaltyTier('Platinum', 2000),
  ];

  static LoyaltyTier forPoints(int points) =>
      all.lastWhere((t) => points >= t.minPoints);

  /// Tier បន្ទាប់ (null បើដល់កំពូលហើយ)
  static LoyaltyTier? next(int points) {
    for (final t in all) {
      if (t.minPoints > points) return t;
    }
    return null;
  }
}
