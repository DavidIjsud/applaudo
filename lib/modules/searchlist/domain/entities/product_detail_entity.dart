class ProductDetailEntity {
  final String? id;
  final String? title;
  final num? price;
  final List<String> listUrlImages;
  final String? currency;

  ProductDetailEntity({
    this.id,
    this.title,
    this.price,
    this.listUrlImages = const [],
    this.currency,
  });

  factory ProductDetailEntity.fromJson(Map<String, dynamic> json) {
    return ProductDetailEntity(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      listUrlImages: json['pictures'] != null
          ? List<String>.from(
              json['pictures'].map((picture) => picture['url'] ?? ''))
          : [],
      currency: json['currency_id'],
    );
  }
}
