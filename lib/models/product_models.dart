class ProductModel {
  final String slug;
  final String name;
  final String store;
  final String image;
  final String currency;
  final double price;
  final double oldPrice;

  ProductModel({
    required this.slug,
    required this.name,
    required this.store,
    required this.image,
    required this.currency,
    required this.price,
    required this.oldPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      slug: json['slug'] ?? '',
      name: json['name'] ?? '',
      store: json['store'] ?? '',
      image: json['image'] ?? '',
      currency: json['symbol_left'] ?? '',
      price: double.tryParse(json['price'] ?? '0') ?? 0,
      oldPrice: double.tryParse(json['oldprice'] ?? '0') ?? 0,
    );
  }
}
