/// Restaurant domain model representing a food establishment.
class RestaurantModel {
  final String id;
  final String name;
  final String? nameKhmer;
  final String cuisine;
  final double rating;
  final int reviewCount;
  final int deliveryTimeMinutes;
  final double deliveryFee;
  final String? imageUrl;
  final String? bannerUrl;
  final bool isOpen;
  final String address;
  final List<String> categories;

  const RestaurantModel({
    required this.id,
    required this.name,
    this.nameKhmer,
    required this.cuisine,
    required this.rating,
    required this.reviewCount,
    required this.deliveryTimeMinutes,
    required this.deliveryFee,
    this.imageUrl,
    this.bannerUrl,
    this.isOpen = true,
    required this.address,
    this.categories = const [],
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      nameKhmer: json['nameKhmer'] as String?,
      cuisine: json['cuisine'] as String? ?? 'General',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      deliveryTimeMinutes: (json['deliveryTimeMinutes'] as num?)?.toInt() ?? 25,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 1.5,
      imageUrl: json['imageUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      isOpen: json['isOpen'] as bool? ?? true,
      address: json['address'] as String? ?? '',
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nameKhmer': nameKhmer,
      'cuisine': cuisine,
      'rating': rating,
      'reviewCount': reviewCount,
      'deliveryTimeMinutes': deliveryTimeMinutes,
      'deliveryFee': deliveryFee,
      'imageUrl': imageUrl,
      'bannerUrl': bannerUrl,
      'isOpen': isOpen,
      'address': address,
      'categories': categories,
    };
  }

  RestaurantModel copyWith({
    String? id,
    String? name,
    String? nameKhmer,
    String? cuisine,
    double? rating,
    int? reviewCount,
    int? deliveryTimeMinutes,
    double? deliveryFee,
    String? imageUrl,
    String? bannerUrl,
    bool? isOpen,
    String? address,
    List<String>? categories,
  }) {
    return RestaurantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      nameKhmer: nameKhmer ?? this.nameKhmer,
      cuisine: cuisine ?? this.cuisine,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      deliveryTimeMinutes: deliveryTimeMinutes ?? this.deliveryTimeMinutes,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      imageUrl: imageUrl ?? this.imageUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      isOpen: isOpen ?? this.isOpen,
      address: address ?? this.address,
      categories: categories ?? this.categories,
    );
  }
}
