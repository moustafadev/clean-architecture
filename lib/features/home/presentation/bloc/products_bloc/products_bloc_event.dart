part of 'products_bloc_bloc.dart';

abstract class ProductsBlocEvent extends Equatable {
  const ProductsBlocEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsEvent extends ProductsBlocEvent {}

class RefeshProductsEvent extends ProductsBlocEvent {}
