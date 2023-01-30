import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/Failure.dart';
import 'package:ecommerce/features/home/domain/entities/products.dart';
import 'package:ecommerce/features/home/domain/usercases/get_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/styles/string.dart';
import '../../../../../locator.dart';
import '../catigories_bloc/bloc/categories_bloc.dart';

part 'products_bloc_event.dart';
part 'products_bloc_state.dart';

class ProductsBloc extends Cubit<ProductsBlocState> {
  static ProductsBloc get(context) => BlocProvider.of(context);

  final GetProductsUsercase getProductsUsercase;

  int indexItem = 0;
  ProductsBloc(this.getProductsUsercase) : super(ProductsBlocInitial());

  ProductsBlocState _mapFailureToProductsState(
      Either<Failure, AllProducts> failureOrProducts) {
    return failureOrProducts.fold(
        (failure) => ErrorProductsState(massage: _massageFailure(failure)),
        (product) => SuccessProductsState(allProducts: product));
  }

  void getProducts(String tagCategory) async {
    emit(LoadingProductsState());
    final failureOrProducts = await getProductsUsercase.call(tagCategory);
    emit(_mapFailureToProductsState(failureOrProducts));
  }

  String _massageFailure(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return INTERNETNOTCONECTION;
      case ServerFailure:
        return SERVERERROR;
      case EmptyCacheFailure:
        return EMPTYCACHE;
      default:
        return "unexpected Error";
    }
  }
}
