class ProductDTO {
  final String id;
  final String title;
  final num price;
  final String thumbNail;
  final String currency;

  ProductDTO({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbNail,
    required this.currency,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) => ProductDTO(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        thumbNail: json["thumbnail"],
        currency: json["currency_id"],
      );
}
