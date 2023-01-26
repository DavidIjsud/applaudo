part of 'detail_product_bloc.dart';

abstract class DetailProductState extends Equatable {
  const DetailProductState();

  @override
  List<Object> get props => [];
}

class DetailProductInitial extends DetailProductState {}

class DetailProductLoading extends DetailProductState {}

class DetailProductLoaded extends DetailProductState {
  final ProductDetailEntity? productDetailEntity;

  const DetailProductLoaded({required this.productDetailEntity});

  @override
  List<Object> get props => [productDetailEntity ?? ''];
}

class DetailProductError extends DetailProductState {
  final String message;

  const DetailProductError({required this.message});

  @override
  List<Object> get props => [message];
}

class NoInternetState extends DetailProductState {
  const NoInternetState();

  @override
  List<Object> get props => [];
}

class VisitedListLoaded extends DetailProductState {
  final List<ProductDetailEntity> listVisited;

  const VisitedListLoaded({required this.listVisited});

  @override
  List<Object> get props => [listVisited];
}
