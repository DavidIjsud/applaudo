import 'package:applaudo/modules/searchlist/data/dtos/product.dart';
import 'package:applaudo/modules/searchlist/data/dtos/product_detail.dart';
import 'package:applaudo/modules/searchlist/data/repository/repository_search_list.dart';
import 'package:applaudo/modules/searchlist/domain/entities/product_detail_entity.dart';
import 'package:applaudo/modules/searchlist/domain/entities/product_entity.dart';
import 'package:applaudo/modules/searchlist/domain/usecases/search_list_case.dart';

class SearchListCaseImpl implements SearchListCase {
  final RepositorySearchList repository;

  SearchListCaseImpl({required this.repository});

  @override
  Future<List<ProductEntity>> searchListCase(String query) async {
    List<ProductDTO> listProducts = await repository.getSearchList(query);
    return listProducts
        .map((ProductDTO product) => ProductEntity(
              id: product.id,
              title: product.title,
              price: product.price,
              thumbNail: product.thumbNail,
              currency: product.currency,
            ))
        .toList();
  }

  @override
  Future<ProductDetailEntity?> getProductDetailCase(String idProduct) async {
    ProductDetailDTO? productDetailDTO =
        await repository.getProductDetail(idProduct);

    return productDetailDTO != null
        ? ProductDetailEntity(
            id: productDetailDTO.id,
            title: productDetailDTO.title,
            price: productDetailDTO.price,
            listUrlImages: productDetailDTO.listUrlImages,
            currency: productDetailDTO.currency,
          )
        : null;
  }
}
