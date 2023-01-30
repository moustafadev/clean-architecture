import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/domain/entities/products.dart';

import '../../../../core/error/Failure.dart';

abstract class ProductsRepository {
  Future<Either<Failure, AllProducts>> getAllProducts(String category);
}
