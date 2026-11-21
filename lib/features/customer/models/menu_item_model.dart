/// Menu Item / Food domain model.
class MenuItemModel {
  final String id;
  final String restaurantId;
  final String name;
  final String? nameKhmer;
  final String description;
  final double price;
  final String? imageUrl;
  final String category;
  final bool isAvailable;
  final List<String> options;

  const MenuItemModel({
    required this.id,
    required this.restaurantId,
    required this.name,
    this.nameKhmer,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.category,
    this.isAvailable = true,
    this.options = const [],
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      id: json['id'] as String,
      restaurantId: json['restaurantId'] as String? ?? '',
      name: json['name'] as String,
      nameKhmer: json['nameKhmer'] as String?,
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] as String? ?? 'General',
      isAvailable: json['isAvailable'] as bool? ?? true,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'name': name,
      'nameKhmer': nameKhmer,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'isAvailable': isAvailable,
      'options': options,
    };
  }

  MenuItemModel copyWith({
    String? id,
    String? restaurantId,
    String? name,
    String? nameKhmer,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    bool? isAvailable,
    List<String>? options,
  }) {
    return MenuItemModel(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      name: name ?? this.name,
      nameKhmer: nameKhmer ?? this.nameKhmer,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      isAvailable: isAvailable ?? this.isAvailable,
      options: options ?? this.options,
    );
  }
}
