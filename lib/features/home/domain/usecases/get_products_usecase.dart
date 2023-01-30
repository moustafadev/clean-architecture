import 'package:ecommerce/features/home/domain/entities/products.dart';
import 'package:ecommerce/core/error/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/domain/repositories/products_repositories.dart';

class GetProductsUseCase {
  final ProductsRepository _productsRepositories;

  GetProductsUsercase(this._productsRepositories);

  Future<Either<Failure, AllProducts>> call(String category) async {
    return await _productsRepositories.getAllProducts(category);
  }
}
