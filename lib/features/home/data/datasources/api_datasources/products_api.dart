import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/dio/dio_api.dart';
import 'package:ecommerce/core/error/Failure.dart';
import 'package:ecommerce/core/error/exception.dart';

import '../../../../../core/styles/string.dart';
import '../../models/products_model.dart';

abstract class ProductsApi {
  Future<ApiResponse<AllProductsModel>> getAllProducts(String category);
}

class ProductsApiImpl extends ApiBase implements ProductsApi {
  ProductsApiImpl() {
    endpoint = '';
  }

  @override
  Future<ApiResponse<AllProductsModel>> getAllProducts(String category) async {
    try {
      var result = await get('$URLGETALLPRODUCTS$category');
      print(result.json);
      return ApiResponse(200, AllProductsModel.fromJson(result.json));
    } on ServerException {
      throw ServerFailure();
    }
  }
}
