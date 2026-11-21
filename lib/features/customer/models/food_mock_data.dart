import '../../../shared/widgets/badges/status_badge.dart';
import 'menu_item_model.dart';
import 'order_model.dart';
import 'restaurant_model.dart';

/// Seed mock dataset containing restaurants, dishes, and orders for development & testing.
class FoodMockData {
  FoodMockData._();

  // ---------------------------------------------------------------------------
  // Mock Restaurants
  // ---------------------------------------------------------------------------
  static const List<RestaurantModel> restaurants = [
    RestaurantModel(
      id: 'rest_01',
      name: 'Khmer Heritage Kitchen',
      nameKhmer: 'ផ្ទះបាយមរតកខ្មែរ',
      cuisine: 'Traditional Khmer',
      rating: 4.8,
      reviewCount: 320,
      deliveryTimeMinutes: 20,
      deliveryFee: 1.25,
      address: 'Street 302, BKK1, Phnom Penh',
      categories: ['Khmer', 'Rice & Noodles', 'Breakfast', 'Popular'],
      isOpen: true,
    ),
    RestaurantModel(
      id: 'rest_02',
      name: 'Angkor Golden Grill & Lok Lak',
      nameKhmer: 'អង្គរហ្គោលដិន ឡុកឡាក់សាច់គោ',
      cuisine: 'Asian & Grill',
      rating: 4.7,
      reviewCount: 215,
      deliveryTimeMinutes: 25,
      deliveryFee: 1.50,
      address: 'Street 155, Toul Tom Poung, Phnom Penh',
      categories: ['Grill', 'Beef', 'Lunch', 'Popular'],
      isOpen: true,
    ),
    RestaurantModel(
      id: 'rest_03',
      name: 'Nom Banh Chok Siem Reap House',
      nameKhmer: 'នំបញ្ចុកសៀមរាបរសជាតិដើម',
      cuisine: 'Traditional Noodles',
      rating: 4.9,
      reviewCount: 450,
      deliveryTimeMinutes: 15,
      deliveryFee: 1.00,
      address: 'Preah Monivong Blvd, Daun Penh, Phnom Penh',
      categories: ['Noodles', 'Khmer', 'Breakfast'],
      isOpen: true,
    ),
    RestaurantModel(
      id: 'rest_04',
      name: 'Mekong Breeze Cafe & Bakery',
      nameKhmer: 'មេគង្គប្រ៊ីស កាហ្វេ និងនំ',
      cuisine: 'Coffee & Bakery',
      rating: 4.6,
      reviewCount: 180,
      deliveryTimeMinutes: 20,
      deliveryFee: 1.25,
      address: 'Norodom Blvd, Phnom Penh',
      categories: ['Coffee', 'Drinks', 'Bakery', 'Dessert'],
      isOpen: true,
    ),
  ];

  // ---------------------------------------------------------------------------
  // Mock Menu Items
  // ---------------------------------------------------------------------------
  static const List<MenuItemModel> menuItems = [
    // Restaurant 1: Khmer Heritage Kitchen
    MenuItemModel(
      id: 'item_01',
      restaurantId: 'rest_01',
      name: 'Broken Rice with Grilled Pork (Bay Sach Chrouk)',
      nameKhmer: 'បាយសាច់ជ្រូកអាំងពិសេស',
      description: 'Marinated grilled pork over warm rice served with pickled vegetables and clear soup.',
      price: 2.75,
      category: 'Breakfast',
      options: ['Extra Pork', 'Fried Egg', 'More Pickles'],
      isAvailable: true,
    ),
    MenuItemModel(
      id: 'item_02',
      restaurantId: 'rest_01',
      name: 'Fish Amok in Coconut Cup',
      nameKhmer: 'អាម៉ុកត្រីដូងខ្ចី',
      description: 'Steamed curried river fish cooked in aromatic kroeung spice paste and coconut milk.',
      price: 5.50,
      category: 'Lunch',
      options: ['Spicy', 'Mild', 'Extra Steamed Rice'],
      isAvailable: true,
    ),

    // Restaurant 2: Angkor Golden Grill
    MenuItemModel(
      id: 'item_03',
      restaurantId: 'rest_02',
      name: 'Tender Beef Lok Lak with Kampot Pepper',
      nameKhmer: 'ឡុកឡាក់សាច់គោម្រេចកំពត',
      description: 'Stir-fried cubed tender beef served with fresh lettuce, tomatoes, and lime-pepper dip.',
      price: 4.50,
      category: 'Grill',
      options: ['Medium Rare', 'Well Done', 'Add Fried Egg'],
      isAvailable: true,
    ),
    MenuItemModel(
      id: 'item_04',
      restaurantId: 'rest_02',
      name: 'Grilled Beef Skewers (5 sticks)',
      nameKhmer: 'សាច់គោអាំងចង្កាក់ (៥ ចង្កាក់)',
      description: 'Lemongrass marinated grilled beef skewers with papaya pickle.',
      price: 3.50,
      category: 'Grill',
      options: ['Baguette', 'Sticky Rice'],
      isAvailable: true,
    ),

    // Restaurant 3: Nom Banh Chok
    MenuItemModel(
      id: 'item_05',
      restaurantId: 'rest_03',
      name: 'Nom Banh Chok Samlor Khmer',
      nameKhmer: 'នំបញ្ចុកសម្លខ្មែរ',
      description: 'Traditional Khmer rice noodles with yellow fish green curry broth, fresh herbs, and banana blossom.',
      price: 2.50,
      category: 'Noodles',
      options: ['Extra Herbs', 'Extra Broth', 'Crispy Fish'],
      isAvailable: true,
    ),
    MenuItemModel(
      id: 'item_06',
      restaurantId: 'rest_03',
      name: 'Nom Banh Chok Samlor Kari',
      nameKhmer: 'នំបញ្ចុកសម្លការីសាច់មាន់',
      description: 'Khmer red curry chicken noodles with tender sweet potatoes and string beans.',
      price: 3.25,
      category: 'Noodles',
      options: ['Spicy', 'Normal', 'Extra Chicken'],
      isAvailable: true,
    ),

    // Restaurant 4: Mekong Breeze Cafe
    MenuItemModel(
      id: 'item_07',
      restaurantId: 'rest_04',
      name: 'Iced Milk Coffee (Cafe Teuk Doh Koh Tik Kak)',
      nameKhmer: 'កាហ្វេទឹកដោះគោទឹកកកពិសេស',
      description: 'Strong drip dark roast coffee sweetened with rich condensed milk over crushed ice.',
      price: 2.00,
      category: 'Coffee',
      options: ['Less Sweet (50%)', 'Normal Sweet', 'Extra Shot Espresso'],
      isAvailable: true,
    ),
    MenuItemModel(
      id: 'item_08',
      restaurantId: 'rest_04',
      name: 'Passion Fruit Soda with Chia Seeds',
      nameKhmer: 'ផាសិនសូដាគ្រាប់ជី',
      description: 'Refreshing tropical passion fruit puree with sparkling soda water and chia seeds.',
      price: 2.50,
      category: 'Drinks',
      options: ['Less Sweet', 'Normal Sweet'],
      isAvailable: true,
    ),
  ];

  // ---------------------------------------------------------------------------
  // Mock Orders
  // ---------------------------------------------------------------------------
  static List<OrderModel> get orders => [
        OrderModel(
          id: '1042',
          restaurantId: 'rest_02',
          restaurantName: 'Angkor Golden Grill & Lok Lak',
          customerId: 'cust_01',
          customerName: 'Sokha Chan',
          status: OrderStatus.inDelivery,
          items: const [
            OrderItemModel(
              id: 'ord_item_01',
              menuItemId: 'item_03',
              name: 'Tender Beef Lok Lak with Kampot Pepper',
              price: 4.50,
              quantity: 2,
              selectedOptions: 'Add Fried Egg',
            ),
            OrderItemModel(
              id: 'ord_item_02',
              menuItemId: 'item_04',
              name: 'Grilled Beef Skewers (5 sticks)',
              price: 3.50,
              quantity: 1,
              selectedOptions: 'Sticky Rice',
            ),
          ],
          subtotal: 12.50,
          deliveryFee: 1.50,
          discount: 1.00,
          total: 13.00,
          deliveryAddress: 'Building 14, St. 214, BKK1, Phnom Penh',
          createdAt: DateTime.now().subtract(const Duration(minutes: 25)),
          driverName: 'Rathana Seng',
          driverPhone: '+855 12 345 678',
        ),
        OrderModel(
          id: '1041',
          restaurantId: 'rest_01',
          restaurantName: 'Khmer Heritage Kitchen',
          customerId: 'cust_01',
          customerName: 'Sokha Chan',
          status: OrderStatus.preparing,
          items: const [
            OrderItemModel(
              id: 'ord_item_03',
              menuItemId: 'item_01',
              name: 'Broken Rice with Grilled Pork',
              price: 2.75,
              quantity: 2,
              selectedOptions: 'Extra Pork',
            ),
          ],
          subtotal: 5.50,
          deliveryFee: 1.25,
          discount: 0.0,
          total: 6.75,
          deliveryAddress: 'Building 14, St. 214, BKK1, Phnom Penh',
          createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
        ),
        OrderModel(
          id: '1039',
          restaurantId: 'rest_04',
          restaurantName: 'Mekong Breeze Cafe & Bakery',
          customerId: 'cust_01',
          customerName: 'Sokha Chan',
          status: OrderStatus.completed,
          items: const [
            OrderItemModel(
              id: 'ord_item_04',
              menuItemId: 'item_07',
              name: 'Iced Milk Coffee',
              price: 2.00,
              quantity: 2,
              selectedOptions: 'Less Sweet (50%)',
            ),
          ],
          subtotal: 4.00,
          deliveryFee: 1.25,
          discount: 0.0,
          total: 5.25,
          deliveryAddress: 'Building 14, St. 214, BKK1, Phnom Penh',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          driverName: 'Vanna Kim',
          driverPhone: '+855 98 765 432',
        ),
      ];
}
