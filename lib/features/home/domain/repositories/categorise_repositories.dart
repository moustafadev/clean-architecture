import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/domain/entities/caregories.dart';

import '../../../../core/error/Failure.dart';

abstract class CategoriseRepository {
  Future<Either<Failure, Categories>> getCategorise();
}
