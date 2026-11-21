import '../../../shared/widgets/badges/status_badge.dart';

/// Single item within a customer order or cart.
class OrderItemModel {
  final String id;
  final String menuItemId;
  final String name;
  final double price;
  final int quantity;
  final String? selectedOptions;
  final String? note;

  const OrderItemModel({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.price,
    required this.quantity,
    this.selectedOptions,
    this.note,
  });

  double get totalPrice => price * quantity;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'] as String,
      menuItemId: json['menuItemId'] as String? ?? '',
      name: json['name'] as String,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      selectedOptions: json['selectedOptions'] as String?,
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menuItemId': menuItemId,
      'name': name,
      'price': price,
      'quantity': quantity,
      'selectedOptions': selectedOptions,
      'note': note,
    };
  }

  OrderItemModel copyWith({
    String? id,
    String? menuItemId,
    String? name,
    double? price,
    int? quantity,
    String? selectedOptions,
    String? note,
  }) {
    return OrderItemModel(
      id: id ?? this.id,
      menuItemId: menuItemId ?? this.menuItemId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      note: note ?? this.note,
    );
  }
}

/// Order domain model tracking entire lifecycle across roles.
class OrderModel {
  final String id;
  final String restaurantId;
  final String restaurantName;
  final String customerId;
  final String customerName;
  final OrderStatus status;
  final List<OrderItemModel> items;
  final double subtotal;
  final double deliveryFee;
  final double discount;
  final double total;
  final String deliveryAddress;
  final DateTime createdAt;
  final String? driverName;
  final String? driverPhone;

  const OrderModel({
    required this.id,
    required this.restaurantId,
    required this.restaurantName,
    required this.customerId,
    required this.customerName,
    required this.status,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    this.discount = 0.0,
    required this.total,
    required this.deliveryAddress,
    required this.createdAt,
    this.driverName,
    this.driverPhone,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      restaurantId: json['restaurantId'] as String? ?? '',
      restaurantName: json['restaurantName'] as String? ?? 'Restaurant',
      customerId: json['customerId'] as String? ?? '',
      customerName: json['customerName'] as String? ?? 'Customer',
      status: _statusFromString(json['status'] as String?),
      items: (json['items'] as List<dynamic>?)
              ?.map((item) => OrderItemModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          const [],
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0.0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      deliveryAddress: json['deliveryAddress'] as String? ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String) ?? DateTime.now()
          : DateTime.now(),
      driverName: json['driverName'] as String?,
      driverPhone: json['driverPhone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'customerId': customerId,
      'customerName': customerName,
      'status': status.name,
      'items': items.map((i) => i.toJson()).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'discount': discount,
      'total': total,
      'deliveryAddress': deliveryAddress,
      'createdAt': createdAt.toIso8601String(),
      'driverName': driverName,
      'driverPhone': driverPhone,
    };
  }

  static OrderStatus _statusFromString(String? statusStr) {
    if (statusStr == null) return OrderStatus.pending;
    return OrderStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == statusStr.toLowerCase(),
      orElse: () => OrderStatus.pending,
    );
  }
}
