import 'package:applaudo/modules/searchlist/domain/entities/product_detail_entity.dart';

abstract class VisitedProductsCase {
  void saveProduct(ProductDetailEntity product);
  List<ProductDetailEntity> getVisitedProducts();
}
