part of 'products_bloc_bloc.dart';

abstract class ProductsBlocState extends Equatable {
  const ProductsBlocState();

  @override
  List<Object> get props => [];
}

class ProductsBlocInitial extends ProductsBlocState {}

class LoadingProductsState extends ProductsBlocState {
  @override
  List<Object> get props => [];
}

class SuccessProductsState extends ProductsBlocState {
  final AllProducts allProducts;

  const SuccessProductsState({required this.allProducts});
  @override
  List<Object> get props => [allProducts];
}

class ErrorProductsState extends ProductsBlocState {
  final String massage;

  const ErrorProductsState({required this.massage});
  @override
  List<Object> get props => [massage];
}
