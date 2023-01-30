import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/features/home/domain/entities/products.dart';
import 'package:ecommerce/core/error/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/domain/repositories/products_repositories.dart';

import '../datasources/api_datasources/products_api.dart';
import '../datasources/local_datasorce/products_local.dart';

class ProductsRepoImpl implements ProductsRepository {
  final ProductsApiImpl productsApiImpl;
  final NetworkInfoImpl networkInfoImpl;
  final ProductsLocalImpl productsLocalImpl;

  ProductsRepoImpl(
      {required this.productsApiImpl,
      required this.networkInfoImpl,
      required this.productsLocalImpl});

  @override
  Future<Either<Failure, AllProducts>> getAllProducts(String category) async {
    if (await networkInfoImpl.isConnected) {
      try {
        final productsRes = await productsApiImpl.getAllProducts(category);
        await productsLocalImpl.cacheProducts(productsRes.load);
        return Right(productsRes.load);
      } on ServerException {
        throw Left(ServerFailure());
      }
    } else {
      final productsLocal = await productsLocalImpl.getAllProductsLocal();
      return Right(productsLocal);
    }
  }
}
