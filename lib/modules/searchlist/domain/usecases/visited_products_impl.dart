import 'package:applaudo/modules/searchlist/domain/entities/product_detail_entity.dart';

import 'visisted_products.dart';

class VisitedProductsImpl implements VisitedProductsCase {
  VisitedProductsImpl();

  List<ProductDetailEntity> listVisitedProducts = [];

  @override
  List<ProductDetailEntity> getVisitedProducts() {
    listVisitedProducts = listVisitedProducts.take(4).toList();
    return listVisitedProducts;
  }

  @override
  void saveProduct(ProductDetailEntity product) {
    listVisitedProducts.insert(0, product);
  }
}
