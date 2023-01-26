part of 'searchlist_bloc.dart';

enum ErrorType {
  noInternet,
  unknownError,
  noProductsFound,
  noDetailProductFound
}

@immutable
abstract class SearchlistState extends Equatable {}

class SearchlistInitial extends SearchlistState {
  @override
  List<Object?> get props => [];
}

class ErrorOnRequest extends SearchlistState {
  final ErrorType errorType;

  ErrorOnRequest({required this.errorType});

  @override
  List<Object?> get props => [errorType];
}

class LoadingRequest extends SearchlistState {
  @override
  List<Object?> get props => [];
}

class SuccessRequest extends SearchlistState {
  final List<ProductEntity> products;

  SuccessRequest({required this.products});

  @override
  List<Object?> get props => [products];
}
