class ProductEntity {
  final String id;
  final String title;
  final num price;
  final String thumbNail;
  final String currency;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbNail,
    required this.currency,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) => ProductEntity(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        thumbNail: json["thumbNail"],
        currency: json["currency_id"],
      );
}
