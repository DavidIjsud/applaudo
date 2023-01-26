import 'package:applaudo/modules/searchlist/data/dtos/product.dart';
import 'package:applaudo/modules/searchlist/data/dtos/product_detail.dart';

abstract class RepositorySearchList {
  Future<List<ProductDTO>> getSearchList(String query);
  Future<ProductDetailDTO?> getProductDetail(String idProduct);
}
