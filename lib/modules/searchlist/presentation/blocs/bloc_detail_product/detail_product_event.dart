part of 'detail_product_bloc.dart';

abstract class DetailProductEvent extends Equatable {
  const DetailProductEvent();

  @override
  List<Object> get props => [];
}

class OnSearchDetailProduct extends DetailProductEvent {
  final String idProduct;

  const OnSearchDetailProduct({required this.idProduct});

  @override
  List<Object> get props => [idProduct];
}

class OnSaveVisitedProduct extends DetailProductEvent {
  final ProductDetailEntity productDetailEntity;

  const OnSaveVisitedProduct({required this.productDetailEntity});

  @override
  List<Object> get props => [productDetailEntity];
}

class OnOnbtaingVisitedProduct extends DetailProductEvent {
  const OnOnbtaingVisitedProduct();

  @override
  List<Object> get props => [];
}
