class Laptop {
  int id;
  String name;
  double price;
  String image;
  double rating;
  int quantity;
  bool isFavourite;

  Laptop({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
    required this.quantity,
    required this.isFavourite,
  });

  // ✅ Hàm copyWith() đầy đủ
  Laptop copyWith({
    int? id,
    String? name,
    double? price,
    String? image,
    double? rating,
    int? quantity,
    bool? isFavourite,
  }) {
    return Laptop(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      quantity: quantity ?? this.quantity,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
