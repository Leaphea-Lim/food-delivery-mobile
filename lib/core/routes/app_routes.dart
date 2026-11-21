/// Centralized route names for navigation across all user roles.
class AppRoutes {
  AppRoutes._();

  // Auth Routes
  static const String welcome = '/';
  static const String authLanding = '/auth/landing';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String verifyOtp = '/auth/verify-otp';
  static const String resetPassword = '/auth/reset-password';
  static const String emailFlow = '/auth/email-flow';

  // Customer Routes
  static const String customerHome = '/customer/home';
  static const String customerRestaurantDetail = '/customer/restaurant-detail';
  static const String customerCart = '/customer/cart';
  static const String customerCheckout = '/customer/checkout';
  static const String customerOrders = '/customer/orders';
  static const String customerOrderDetails = '/customer/order-details';
  static const String customerFavorites = '/customer/favorites';
  static const String customerProfile = '/customer/profile';
  static const String customerEditProfile = '/customer/edit-profile';
  static const String customerAddresses = '/customer/addresses';
  static const String customerAddAddress = '/customer/add-address';
  static const String customerPaymentMethods = '/customer/payment-methods';
  static const String customerAddPaymentMethod = '/customer/add-payment-method';
  static const String customerLoyalty = '/customer/loyalty';
  static const String customerReferral = '/customer/referral';
  static const String customerNotifications = '/customer/notifications';

  // Driver Routes
  static const String driverDashboard = '/driver/dashboard';
  static const String driverDeliveryRequests = '/driver/delivery-requests';
  static const String driverActiveDelivery = '/driver/active-delivery';
  static const String driverPickupConfirmation = '/driver/pickup-confirmation';
  static const String driverDeliveryConfirmation = '/driver/delivery-confirmation';
  static const String driverEarnings = '/driver/earnings';
  static const String driverProfile = '/driver/profile';

  // Restaurant Routes
  static const String restaurantDashboard = '/restaurant/dashboard';
  static const String restaurantOrders = '/restaurant/orders';
  static const String restaurantOrderDetails = '/restaurant/order-details';
  static const String restaurantMenu = '/restaurant/menu';
  static const String restaurantAddEditFood = '/restaurant/add-edit-food';
  static const String restaurantProfile = '/restaurant/profile';
  static const String restaurantSettings = '/restaurant/settings';
  static const String restaurantNotifications = '/restaurant/notifications';

  // Admin Routes
  static const String adminDashboard = '/admin/dashboard';
  static const String adminRestaurants = '/admin/restaurants';
  static const String adminCustomers = '/admin/customers';
  static const String adminDrivers = '/admin/drivers';
  static const String adminOrders = '/admin/orders';
  static const String adminSettings = '/admin/settings';
}
