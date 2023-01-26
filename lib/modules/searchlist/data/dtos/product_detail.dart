class ProductDetailDTO {
  final String? id;
  final String? title;
  final num? price;
  final List<String> listUrlImages;
  final String? currency;

  ProductDetailDTO({
    this.id,
    this.title,
    this.price,
    this.listUrlImages = const [],
    this.currency,
  });

  factory ProductDetailDTO.fromJson(Map<String, dynamic> json) {
    return ProductDetailDTO(
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
