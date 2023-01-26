import 'package:bloc/bloc.dart';
import 'package:applaudo/exceptions/not_internet_exception.dart';
import 'package:applaudo/modules/searchlist/domain/entities/product_detail_entity.dart';
import 'package:applaudo/modules/searchlist/domain/usecases/search_list_case.dart';
import 'package:applaudo/modules/searchlist/domain/usecases/visisted_products.dart';
import 'package:applaudo/shared/constants/error_constants.dart';
import 'package:equatable/equatable.dart';

part 'detail_product_event.dart';
part 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  final SearchListCase searchListCase;
  final VisitedProductsCase visitedProductsCase;

  DetailProductBloc({
    required this.searchListCase,
    required this.visitedProductsCase,
  }) : super(DetailProductInitial()) {
    on<OnSearchDetailProduct>(_onSearchListProducts);
    on<OnSaveVisitedProduct>(_onSaveVisitedProduct);
    on<OnOnbtaingVisitedProduct>(_onObtainVisistedProducts);
  }

  Future<void> _onObtainVisistedProducts(
      OnOnbtaingVisitedProduct event, Emitter<DetailProductState> emit) async {
    emit(VisitedListLoaded(
        listVisited: visitedProductsCase.getVisitedProducts()));
  }

  Future<void> _onSaveVisitedProduct(
      OnSaveVisitedProduct event, Emitter<DetailProductState> emit) async {
    visitedProductsCase.saveProduct(event.productDetailEntity);
  }

  Future<void> _onSearchListProducts(
      OnSearchDetailProduct event, Emitter<DetailProductState> emit) async {
    emit(DetailProductLoading());
    try {
      ProductDetailEntity? productDetail =
          await searchListCase.getProductDetailCase(event.idProduct);
      emit(DetailProductLoaded(productDetailEntity: productDetail));
    } on NoInternetException {
      emit(const NoInternetState());
    } catch (e) {
      emit(const DetailProductError(message: cantGetDataTryLater));
    }
  }
}
