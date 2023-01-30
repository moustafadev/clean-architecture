import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/domain/entities/caregories.dart';

import '../../../../core/error/Failure.dart';
import '../repositories/categorise_repositories.dart';

class GetCategoriseUsercase {
  final CategoriseRepository categoriseRepositories;

  GetCategoriseUsercase({required this.categoriseRepositories});
  Future<Either<Failure, Categories>> call() async {
    return await categoriseRepositories.getCategorise();
  }
}
