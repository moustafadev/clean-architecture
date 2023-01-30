import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/dio/dio_api.dart';
import 'package:ecommerce/core/error/Failure.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/home/data/models/categories_model.dart';

import '../../../../../core/styles/string.dart';
import '../../models/products_model.dart';

abstract class CategoriesApi {
  Future<ApiResponse<CategoriesModel>> getCategorise();
}

class CategoriesApiImpl extends ApiBase implements CategoriesApi {
  CategoriesApiImpl() {
    endpoint = '';
  }

  @override
  @override
  Future<ApiResponse<CategoriesModel>> getCategorise() async {
    try {
      final request = await get(URLCATEGORIES);
      return ApiResponse(200, CategoriesModel.fromJson(request.json));
    } on ServerException {
      throw ServerFailure();
    }
  }
}
