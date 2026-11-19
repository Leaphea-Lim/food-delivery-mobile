/// Common formatters for currency, dates, and order numbers.
class Formatters {
  Formatters._();

  /// Formats currency with dollar symbol (e.g. $12.50)
  static String formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  /// Formats currency in Cambodian Riel (KHR)
  static String formatKHR(double amount) {
    final int riel = (amount * 4100).round();
    return '$riel ៛';
  }

  /// Formats order reference ID (e.g. #ORD-1042)
  static String formatOrderId(String id) {
    return '#ORD-${id.toUpperCase()}';
  }
}
