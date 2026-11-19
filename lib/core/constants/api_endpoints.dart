/// REST API endpoints and network configuration constants.
class ApiEndpoints {
  ApiEndpoints._();

  // Base URL
  static const String baseUrl = 'https://api.fooddelivery.example.com/v1';

  // Request timeouts
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);

  // Authentication endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh-token';

  // Customer endpoints
  static const String restaurants = '/customer/restaurants';
  static const String foodItems = '/customer/foods';
  static const String customerOrders = '/customer/orders';
  static const String cart = '/customer/cart';
  static const String addresses = '/customer/addresses';

  // Driver endpoints
  static const String driverDashboard = '/driver/dashboard';
  static const String deliveryRequests = '/driver/requests';
  static const String activeDelivery = '/driver/active-delivery';
  static const String driverEarnings = '/driver/earnings';
  static const String driverStatus = '/driver/status';

  // Restaurant endpoints
  static const String restaurantOrders = '/restaurant/orders';
  static const String restaurantMenu = '/restaurant/menu';
  static const String restaurantProfile = '/restaurant/profile';

  // Admin endpoints
  static const String adminAnalytics = '/admin/analytics';
  static const String adminUsers = '/admin/users';
  static const String adminDrivers = '/admin/drivers';
  static const String adminRestaurants = '/admin/restaurants';
}
