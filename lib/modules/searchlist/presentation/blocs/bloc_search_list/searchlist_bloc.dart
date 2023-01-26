import 'package:bloc/bloc.dart';
import 'package:applaudo/exceptions/not_internet_exception.dart';
import 'package:applaudo/exceptions/unknow_error_exception.dart';
import 'package:applaudo/modules/searchlist/domain/entities/product_entity.dart';
import 'package:applaudo/modules/searchlist/domain/usecases/search_list_case.dart';
import 'package:applaudo/modules/searchlist/exceptions/no_products_found_exception.dart';
import 'package:applaudo/shared/constants/error_constants.dart';
import 'package:applaudo/shared/constants/network_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'searchlist_event.dart';
part 'searchlist_state.dart';

class SearchlistBloc extends Bloc<SearchlistEvent, SearchlistState> {
  final SearchListCase searchListCase;

  SearchlistBloc({required this.searchListCase}) : super(SearchlistInitial()) {
    on<SearchListEvent>(_onSearchListProducts);
  }

  String getErrorMaped(ErrorType typeError) {
    switch (typeError) {
      case ErrorType.noDetailProductFound:
        return errorDataNoFound;
      case ErrorType.noProductsFound:
        return errorDataNoFound;
      case ErrorType.noInternet:
        return noInternetConnection;
      default:
        return unknowError;
    }
  }

  Future<void> _onSearchListProducts(
      SearchListEvent event, Emitter<SearchlistState> emit) async {
    try {
      emit(LoadingRequest());
      List<ProductEntity> products =
          await searchListCase.searchListCase(event.query);
      emit(SuccessRequest(products: products));
    } on UnknowErrorException {
      emit(ErrorOnRequest(errorType: ErrorType.noProductsFound));
    } on NoProductFoundException {
      emit(ErrorOnRequest(errorType: ErrorType.noProductsFound));
    } on NoInternetException {
      emit(ErrorOnRequest(errorType: ErrorType.noInternet));
    } catch (e) {
      emit(ErrorOnRequest(errorType: ErrorType.unknownError));
    }
  }
}
