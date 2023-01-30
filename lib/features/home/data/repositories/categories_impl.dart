import 'package:ecommerce/features/home/data/datasources/api_datasources/categories_api.dart';
import 'package:ecommerce/features/home/data/datasources/local_datasorce/categories_local.dart';
import 'package:ecommerce/features/home/domain/entities/caregories.dart';

import 'package:ecommerce/core/error/Failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/categorise_repositories.dart';
import '../datasources/api_datasources/products_api.dart';

class CaregoriesImpl implements CategoriseRepository {
  final CategoriesApiImpl categoriesApiImpl;
  final NetworkInfoImpl networkInfoImpl;
  final CategoriesLocalImpl categoriesLocalImpl;
  CaregoriesImpl(
      this.networkInfoImpl, this.categoriesLocalImpl, this.categoriesApiImpl);
  @override
  Future<Either<Failure, Categories>> getCategorise() async {
    if (await networkInfoImpl.isConnected) {
      try {
        final result = await categoriesApiImpl.getCategorise();
        await categoriesLocalImpl.cacheCategory(result.load);
        return Right(result.load);
      } on ServerException {
        throw Left(ServerFailure());
      }
    } else {
      final result = await categoriesLocalImpl.getAllCategoryLocal();
      return Right(result);
    }
  }
}
